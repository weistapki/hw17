-- Создание таблицы Homework
CREATE TABLE IF NOT EXISTS "Homework" (
                                          "id" SERIAL PRIMARY KEY,
                                          "name" TEXT NOT NULL,
                                          "description" TEXT NOT NULL
);

-- Создание таблицы Lesson
CREATE TABLE IF NOT EXISTS "Lesson" (
                                        "id" SERIAL PRIMARY KEY,
                                        "name" TEXT NOT NULL,
                                        "updatedAt" TIMESTAMP NOT NULL,
                                        "homework_id" INT NOT NULL,
                                        FOREIGN KEY ("homework_id") REFERENCES "Homework" ("id")
    );

-- Создание таблицы Schedule
CREATE TABLE IF NOT EXISTS "Schedule" (
                                          "id" SERIAL PRIMARY KEY,
                                          "name" TEXT NOT NULL,
                                          "updatedAt" TIMESTAMP NOT NULL
);

-- Создание связующей таблицы для связи many-to-many между Schedule и Lesson
CREATE TABLE IF NOT EXISTS "Schedule_Lesson" (
                                                 "schedule_id" INT NOT NULL,
                                                 "lesson_id" INT NOT NULL,
                                                 PRIMARY KEY ("schedule_id", "lesson_id"),
    FOREIGN KEY ("schedule_id") REFERENCES "Schedule" ("id"),
    FOREIGN KEY ("lesson_id") REFERENCES "Lesson" ("id")
    );
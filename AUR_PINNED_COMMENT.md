## paper2slides-git — быстрый старт

### 1) Установка

```bash
yay -S paper2slides-git
```

> Пакет ставит CLI и исходники в `/usr/lib/paper2slides`, но часть Python-зависимостей upstream пока не упакована в официальные репозитории Arch (например `lightrag-hku`, `mineru[core]`).

---

### 2) Рекомендуемый запуск через venv (чтобы подтянуть все зависимости)

```bash
python -m venv ~/.local/share/paper2slides/venv
source ~/.local/share/paper2slides/venv/bin/activate
pip install --upgrade pip
pip install -r /usr/lib/paper2slides/requirements.txt
```

---

### 3) Где указывать API ключи

Есть два варианта.

**Вариант A (файл, постоянный):**

редактируйте файл:

```bash
sudo nano /usr/lib/paper2slides/.env
```

минимальный пример:

```dotenv
RAG_LLM_API_KEY=sk-...
RAG_LLM_BASE_URL=https://api.openai.com/v1
LLM_MODEL=gpt-4o-mini

IMAGE_GEN_PROVIDER=openrouter
IMAGE_GEN_API_KEY=sk-or-...
IMAGE_GEN_BASE_URL=https://openrouter.ai/api/v1
IMAGE_GEN_MODEL=google/gemini-3-pro-image-preview
```

**Вариант B (через консоль, без правки файлов):**

```bash
export RAG_LLM_API_KEY='sk-...'
export RAG_LLM_BASE_URL='https://api.openai.com/v1'
export LLM_MODEL='gpt-4o-mini'

export IMAGE_GEN_PROVIDER='openrouter'
export IMAGE_GEN_API_KEY='sk-or-...'
export IMAGE_GEN_BASE_URL='https://openrouter.ai/api/v1'
export IMAGE_GEN_MODEL='google/gemini-3-pro-image-preview'
```

Чтобы не вводить каждый раз — добавьте эти `export` в `~/.bashrc`.

---

### 4) Первый запуск

```bash
source ~/.local/share/paper2slides/venv/bin/activate
paper2slides --input ./paper.pdf --output slides --length medium --style academic
```

Параллельный режим:

```bash
paper2slides --input ./paper.pdf --output slides --parallel 2
```

---

### 5) Важно

- Нужны валидные ключи LLM/vision-провайдера, без них пайплайн остановится.
- Первый запуск может быть долгим из-за подготовки RAG и зависимостей.
- Для принудительного перезапуска этапов используйте `--from-stage rag|summary|plan|generate`.

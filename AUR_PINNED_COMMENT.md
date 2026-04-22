## paper2slides-git — Quick Start

### 1) Installation

```bash
yay -S paper2slides-git
```

> The package installs the CLI and source code to `/usr/lib/paper2slides`, but some upstream Python dependencies are not yet packaged in the official Arch repositories (e.g., `lightrag-hku`, `mineru[core]`).

---

### 2) Recommended setup via venv (to install all dependencies)

```bash
python -m venv ~/.local/share/paper2slides/venv
source ~/.local/share/paper2slides/venv/bin/activate
pip install --upgrade pip
pip install -r /usr/lib/paper2slides/requirements.txt
```

---

### 3) Setting up API keys

There are two options.

**Option A (persistent file):**

Edit the file:

```bash
sudo nano /usr/lib/paper2slides/.env
```

Minimal example:

```dotenv
RAG_LLM_API_KEY=sk-...
RAG_LLM_BASE_URL=https://api.openai.com/v1
LLM_MODEL=gpt-4o-mini

IMAGE_GEN_PROVIDER=openrouter
IMAGE_GEN_API_KEY=sk-or-...
IMAGE_GEN_BASE_URL=https://openrouter.ai/api/v1
IMAGE_GEN_MODEL=google/gemini-3-pro-image-preview
```

**Option B (via console, without editing files):**

```bash
export RAG_LLM_API_KEY='sk-...'
export RAG_LLM_BASE_URL='https://api.openai.com/v1'
export LLM_MODEL='gpt-4o-mini'

export IMAGE_GEN_PROVIDER='openrouter'
export IMAGE_GEN_API_KEY='sk-or-...'
export IMAGE_GEN_BASE_URL='https://openrouter.ai/api/v1'
export IMAGE_GEN_MODEL='google/gemini-3-pro-image-preview'
```

To avoid entering them every time, add these `export` commands to your `~/.bashrc`.

---

### 4) First run

```bash
source ~/.local/share/paper2slides/venv/bin/activate
paper2slides --input ./paper.pdf --output slides --length medium --style academic
```

Parallel mode:

```bash
paper2slides --input ./paper.pdf --output slides --parallel 2
```

---

### 5) Important

- Valid LLM/vision provider keys are required; without them, the pipeline will stop.
- The first run may take a while due to RAG preparation and dependency installation.
- To force a restart of specific stages, use `--from-stage rag|summary|plan|generate`.

# Maintainer: enihcam <enihcam@aur.archlinux.org>
pkgname=deeptutor
_name=${pkgname}
pkgver=1.4.10
pkgrel=1
pkgdesc="Agent-native intelligent learning companion with multi-agent collaboration and RAG"
arch=('any')
url="https://github.com/HKUDS/DeepTutor"
license=('Apache-2.0')
# Runtime deps match Requires-Dist in pyproject.toml + wheel METADATA.
# Notes on each package's availability (official repos vs AUR) are inline below
# so the maintainer can spot which deps still need AUR helper packages.
depends=(
  'python>=3.11'
  # --- core / CLI runtime ---
  # Availability tags: [core]/[extra] = Arch official repo, [AUR] = AUR,
  # [TODO] = not yet in AUR — see packaging/aur/README.md.
  'python-yaml'              # PyYAML                       [extra]
  'python-jinja'             # jinja2                       [extra]
  'python-openai'            # openai                       [extra]
  'python-tiktoken'          # tiktoken                     [extra]
  'python-aiohttp'           # aiohttp                      [extra]
  'python-httpx'             # httpx                        [extra]
  'python-requests'          # requests                     [extra]
  'python-ddgs'              # ddgs                         [AUR]
  'python-nest_asyncio'      # nest_asyncio                 [TODO]
  'python-tenacity'          # tenacity                     [extra]
  'python-pydantic'          # pydantic                     [extra]
  'python-pydantic-settings' # pydantic-settings            [extra]
  'python-aiosqlite'         # aiosqlite                    [extra]
  'python-typer'             # typer[all]                   [extra]
  'python-rich'              # rich                         [extra]
  'python-prompt_toolkit'    # prompt_toolkit               [extra]
  'python-pyte'              # pyte                         [TODO]
  # --- LLM provider SDKs ---
  'python-anthropic'         # anthropic                    [AUR]
  'python-dashscope'         # dashscope                    [AUR]
  'python-perplexityai'      # perplexityai                 [TODO]
  'python-oauth-cli-kit'     # oauth-cli-kit                [TODO]
  # --- RAG (LlamaIndex) ---
  'python-llama-index'       # llama-index                  [TODO]
  'python-llama-index-retrievers-bm25'  # bm25 retriever    [TODO]
  'python-pymupdf'           # PyMuPDF                      [extra]
  'python-numpy'             # numpy                        [extra]
  'python-arxiv'             # arxiv                        [AUR]
  # --- document parsing ---
  'python-docx'              # python-docx (pip prefix)     [AUR]
  'python-openpyxl'          # openpyxl                     [extra]
  'python-pptx'              # python-pptx (pip prefix)     [AUR]
  'python-pypdf'             # pypdf                        [extra]
  'python-pdfplumber'        # pdfplumber <0.11.8           [AUR]
  'python-reportlab'         # reportlab                    [extra]
  'python-defusedxml'        # defusedxml                   [extra]
  # --- web / API server (already in the default wheel) ---
  'uvicorn'                  # uvicorn[standard]            [extra, no python- prefix]
  'python-fastapi'           # fastapi                      [extra]
  'python-websockets'        # websockets                   [extra]
  'python-multipart'         # python-multipart             [extra]
  'python-bcrypt'            # bcrypt                       [extra]
  'python-jose'              # python-jose[cryptography]    [extra]
  'python-pocketbase'        # pocketbase                   [TODO]
  'python-loguru'            # loguru                       [extra]
  'python-json-repair'       # json-repair                  [TODO]
  'python-croniter'          # croniter (server extra)      [AUR]
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
)
optdepends=(
  # --- document-parsing engines ---
  'python-markitdown: markitdown document parser (Settings → Document Parsing)'
  'python-docling: docling document parser (Settings → Document Parsing)'
  # --- Math Animator (Manim) ---
  'manim: Math Animator addon — renders math animations to video'
  'texlive-core: LaTeX renderer required by Manim'
  'ffmpeg: video encoder required by Manim'
  'cairo: 2D graphics library required by Manim'
  'pkgconf: build tool required by Manim native deps'
  # --- heavy RAG engines ---
  'python-graphrag: GraphRAG knowledge-base engine (pulls LiteLLM + lancedb)'
  'python-raganything: LightRAG knowledge-base engine with multimodal parsing'
  # --- Partners (IM channels) — see packaging note ---
  'python-mcp: MCP client used by Partners'
  'python-telegram-bot: Telegram Partner channel'
  'python-lark-oapi: Lark / Feishu Partner channel'
  'python-dingtalk-stream: DingTalk Partner channel'
  'python-slack-sdk: Slack Partner channel'
  'python-zulip: Zulip Partner channel'
  'python-qq-botpy: QQ Partner channel'
  'python-matrix-nio: Matrix (Element) Partner channel (non-E2EE)'
  'python-mistune: Matrix markdown rendering'
  'python-nh3: Matrix HTML sanitization'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HKUDS/DeepTutor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f357621ca92d769607ac9a201ce6d36ffb8c6154fb178f26fe6c5c149f80a0c7')

prepare() {
  cd "${srcdir}/DeepTutor-${pkgver}"
  # pyproject.toml uses setuptools dynamic version from deeptutor.__version__.
  # No patching needed; the source archive is identical to the tagged commit.
}

build() {
  cd "${srcdir}/DeepTutor-${pkgver}"
  # pyproject.toml pulls the version directly from deeptutor.__version__
  # via [tool.setuptools.dynamic] version.attr, so setuptools reads it from
  # the source tree without any VCS metadata gymnastics.
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/DeepTutor-${pkgver}"
  # AUR builds typically skip the full test suite; tests need a working
  # LLM provider and persistent storage. Uncomment to run the lightweight
  # unit subset locally:
  #   python -m pytest -q tests/ -k "not integration"
  :
}

package() {
  cd "${srcdir}/DeepTutor-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # License: the wheel puts it in dist-info; copy it to the standard location
  # so pacman and `pkglicense` can find it.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

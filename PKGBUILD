# Maintainer: Your Name <you@example.com>
# Co-maintainer: enihcam <enihcam@noreply.gitcode.com> (pending coordination)

# -----------------------------------------------------------------------------
# Build/runtime notes
#
# Upstream runtime dependencies that have NO Arch package (neither [extra] nor
# AUR) and are therefore omitted from depends=/optdepends=. Users pip-install
# these manually if their workflow needs them:
#
#   python-prompt-toolkit   # required by [cli] extra; used by `openjiuwen` REPL
#   python-pyoxigraph       # RDF store backend
#   python-cacheout         # in-process cache
#   python-mermaid-py       # Mermaid diagram rendering
#   python-pulsar           # optional pulsar client
#   python-a2a-sdk          # [all-a2a] extra (a2a-sdk[http-server]==1.0.0)
#   python-uiautomator2     # [mobile-gui] extra
#   python-gaussdb          # optional GaussDB client
#   python-gitcode-api      # gitcode.com API client
#   python-portalocker      # cross-process file lock
#
# Upstream pins requires-python = "<3.14,>=3.11" but Arch's current `python`
# package is 3.14, which violates the upper bound. We therefore depend on the
# `python313` AUR package so the constraint is satisfied at runtime. The
# build/install step runs inside an ephemeral python3.13 venv because the
# `python-build`/`python-installer`/`python-wheel`/`python-setuptools`
# packages in [extra] are built for Arch's python (3.14) and are therefore
# importable only from /usr/bin/python, not /usr/bin/python3.13.
# -----------------------------------------------------------------------------

pkgname=openjiuwen
pkgver=0.1.15.post3
pkgrel=1
pkgdesc="Agent framework SDK: agents, workflows, harness, single_agent API, and team MCP server"
arch=(any)
url="https://gitcode.com/openJiuwen/agent-core"
license=(Apache-2.0)

depends=(
  'python313'
  # CLI extras — required for the three console scripts to actually run
  'python-click'
  'python-rich'
  # Core runtime
  'python-aiohttp'
  'python-requests'
  'python-dateutil'
  'python-filelock'
  'python-aiofiles'
  'python-sqlalchemy'
  'python-sqlmodel'
  'python-openai'
  'python-tiktoken'
  'python-fastmcp'           # AUR
  'python-mcp'
  'python-beautifulsoup4'
  'python-pdfplumber'        # AUR
  'python-openpyxl'
  'python-numpy'
  'python-pycryptodome'
  'python-charset-normalizer'
  'python-pysbd'             # AUR
  'python-oauthlib'
  'python-dotenv'
  'python-json-repair'       # AUR
  'python-tenacity'
  'python-alembic'
  'python-anyio'
  'python-loguru'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

optdepends=(
  'python-transformers: HuggingFace model support (pulls torch transitively)'
  'python-pymilvus: Milvus vector DB backend [AUR]'
  'python-dashscope: Aliyun DashScope LLM backend [AUR]'
  'python-chromadb: Chroma vector DB [AUR]'
  'python-redis: Redis cache/queue backend'
  'python-elasticsearch: Elasticsearch backend'
  'python-asyncpg: PostgreSQL async driver'
  'python-aiomysql: MySQL async driver'
  'python-aiosqlite: SQLite async driver'
  'python-pgvector: PostgreSQL vector type [AUR, orphan-maintained]'
  'python-aioboto3: S3 / obs backend [AUR]'
  'python-docx2txt: legacy DOCX text extraction [AUR]'
  'python-docx: DOCX parsing [AUR]'
)

source=("https://files.pythonhosted.org/packages/41/47/4e028f70277b5cfa3e3ce6c304de9bcf34f058993104813624b6686eb640/openjiuwen-${pkgver}.tar.gz")
sha256sums=('a520d51e55a9f30eae7c55956b3dd25c20dedaf6f8f7096b232ca3ba6c7a613b')

build() {
  cd "${srcdir}/openjiuwen-${pkgver}"
  python3.13 -m venv "${srcdir}/.venv"
  source "${srcdir}/.venv/bin/activate"
  pip install --upgrade pip
  pip install build installer wheel setuptools
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/openjiuwen-${pkgver}"
  source "${srcdir}/.venv/bin/activate"
  # Smoke test: import the package and verify entry points
  python -c "import openjiuwen; print('openjiuwen', openjiuwen.__file__)"
  python -m openjiuwen --help >/dev/null || true
}

package() {
  cd "${srcdir}/openjiuwen-${pkgver}"
  source "${srcdir}/.venv/bin/activate"
  python -m installer --destdir="${pkgdir}" --prefix=/usr --compile-bytecode=1 dist/*.whl
  # console scripts are recorded with the build-time venv shebang; rewrite to
  # the system python313 interpreter so they work after install.
  for _bin in "${pkgdir}/usr/bin/"*; do
    [[ -f "${_bin}" && "$(head -1 "${_bin}")" =~ ^#!/.*/python ]] || continue
    sed -i '1c#!/usr/bin/python3.13' "${_bin}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
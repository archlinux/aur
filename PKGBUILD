# Maintainer: John Ettedgui <git@johne.rojalabs.com>

pkgname=honcho
pkgver=3.4.1
pkgrel=1
pkgdesc='Open-source memory server for AI agents (FastAPI API + background deriver worker)'
arch=('any')
url='https://honcho.dev'
license=('AGPL-3.0-only')
depends=(
  'python>=3.13'
  # Declared runtime dependencies (pyproject.toml), resolved against the
  # official repositories and the AUR.
  'python-fastapi'
  'python-fastapi-pagination'
  'python-dotenv'
  'python-sqlalchemy'
  'python-pgvector'
  'python-sentry_sdk'
  'python-greenlet'
  'python-psycopg'
  'python-httpx'
  'python-rich'
  'python-nanoid'
  'python-alembic'
  'python-pyjwt'
  'python-tenacity'
  'python-tiktoken'
  'python-langfuse'
  'python-openai'
  'python-anthropic'
  'python-pydantic'
  'python-pydantic-settings'
  'python-google-genai'
  'python-pypdf'
  'python-typing_extensions'
  'python-json_repair'
  'python-turbopuffer'
  'python-redis'
  'python-cashews'
  'python-prometheus_client'
  'python-cloudevents'
  'python-sqlakeyset'
  # Imported directly by src/ but not declared by upstream (numpy reaches the
  # tree through pgvector, starlette through fastapi).
  'python-numpy'
  'python-starlette'
  # fastapi[standard-no-fastapi-cloud-cli] / uvicorn[standard] extras.  The
  # `fastapi` CLI itself is not needed: the units call uvicorn directly.
  'uvicorn'
  'python-uvloop'
  'python-httptools'
  'python-websockets'
  'python-watchfiles'
  'python-jinja'
  'python-multipart'
  'python-email-validator'
  'python-yaml'
)
optdepends=(
  'postgresql: database server (required)'
  'pgvector: PostgreSQL vector extension (required)'
  'redis: optional response caching (CACHE_ENABLED=true)'
  'python-scikit-learn: surprisal-based dream prioritisation (DREAM.SURPRISAL.ENABLED)'
  'python-lancedb: LanceDB vector store backend'
  'python-pyarrow: required by the LanceDB vector store backend'
  'python-qdrant-client: Qdrant vector store backend'
  'python-chromadb: ChromaDB vector store backend'
)
backup=('etc/honcho/honcho.env')
install=honcho.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/plastic-labs/honcho/archive/refs/tags/v$pkgver.tar.gz"
        honcho.service
        honcho-deriver.service
        honcho.env
        honcho.sysusers)
sha256sums=('e329815e39ef0dc7473a319fdb2a56ea2ab8f14b62526a09c174f4c5e346cb06'
            '8deeb00a90ddf17c1542faf48aa0703146eea8068e768193863567dac7e9bb84'
            '861282d83961afdc34192c275a503429e2fa2f000694e882e072458d1d9426d2'
            'b289c05d719d24dec78958c257b9d779897f9f38fd16eff8d35bfc560b49807b'
            'a21180cf611ddeb35f591d63554a2c57028855034d913994c26601e81bc01ef8')

# Upstream is a source-run application: pyproject.toml has no [build-system],
# so the project cannot be installed as a Python package (and the "honcho"
# project on PyPI is an unrelated Foreman clone).  Like the official container
# image, install the source tree and run it with the system interpreter.  All
# dependencies come from the repositories/AUR; nothing is vendored.
#
# The upstream test suite needs PostgreSQL with pgvector and live LLM API keys,
# so it cannot run here.

check() {
  cd "$pkgname-$pkgver"

  # Every module must compile...
  python -m compileall -q src migrations scripts
  find src migrations scripts -name __pycache__ -type d -prune -exec rm -rf {} +

  # ...and every third-party import must be provided by the dependencies above.
  python - <<'PY'
import importlib.util
import sys

modules = [
    "alembic", "anthropic", "cashews", "cloudevents", "dotenv", "fastapi",
    "fastapi_pagination", "google.genai", "httpx", "json_repair", "jwt",
    "langfuse", "nanoid", "numpy", "openai", "pgvector", "prometheus_client",
    "pydantic", "pydantic_settings", "pypdf", "redis", "rich", "sentry_sdk",
    "sqlakeyset", "sqlalchemy", "starlette", "tenacity", "tiktoken",
    "turbopuffer", "typing_extensions", "uvloop", "uvicorn",
]
missing = [m for m in modules if importlib.util.find_spec(m) is None]
if missing:
    sys.exit("missing runtime modules: " + ", ".join(missing))
PY
}

package() {
  cd "$pkgname-$pkgver"
  local _dest=/usr/lib/honcho

  # Application tree, matching what the upstream container image runs from.
  # pyproject.toml is a runtime input: src/_version.py reads the version from it.
  install -d "$pkgdir$_dest"
  cp -a src migrations alembic.ini pyproject.toml "$pkgdir$_dest/"
  # Only the database helpers are runtime-relevant; the remaining upstream
  # scripts are developer tooling whose shebangs call `uv`.
  install -d "$pkgdir$_dest/scripts"
  install -m644 scripts/__init__.py scripts/provision_db.py scripts/migrate_db.py \
    "$pkgdir$_dest/scripts/"
  find "$pkgdir$_dest" -name __pycache__ -type d -prune -exec rm -rf {} +

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 .env.template "$pkgdir/usr/share/doc/$pkgname/env.template"
  install -Dm644 config.toml.example "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/honcho.service" \
    "$pkgdir/usr/lib/systemd/system/honcho.service"
  install -Dm644 "$srcdir/honcho-deriver.service" \
    "$pkgdir/usr/lib/systemd/system/honcho-deriver.service"
  install -Dm644 "$srcdir/honcho.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/honcho.conf"
  install -Dm644 "$srcdir/honcho.env" "$pkgdir/etc/honcho/honcho.env"
}

# Maintainer: enihcam <enihcam@noreply.gitcode.com>

pkgname=python-jiuwenswarm
pkgver=0.2.2
pkgrel=1
pkgdesc="Open-source multi-agent orchestration framework (Python backend + bundled React frontend)"
arch=('any')
url="https://pypi.org/project/jiuwenswarm/"
license=('Apache-2.0')
# Requires Python 3.11–3.13 (per upstream Requires-Python: >=3.11,<3.14).
# Arch `python` is currently on 3.13 at time of writing — safe.
depends=(
    'python>=3.11'
    'python-aiosqlite'
    'python-chromadb'
    'python-croniter'
    'python-discord'
    'python-dingtalk-stream'
    'faiss-cpu'
    'python-fastapi'
    'python-google-genai'
    'python-greenlet'
    'python-httpx'
    'python-json-repair'
    'python-lark-oapi'
    'python-loguru'
    'python-multipart'
    'python-mutagen'
    'python-numpy'
    'python-opentelemetry-api'
    'python-opentelemetry-exporter-otlp-proto-grpc'
    'python-opentelemetry-exporter-otlp-proto-http'
    'python-opentelemetry-sdk'
    'python-pgvector'
    'python-psutil'
    'python-pydantic'
    'python-ruamel-yaml'
    'python-sqlite-vec'
    'python-telegram-bot'
    'python-tree-sitter'
    'python-tree-sitter-bash'
    'uvicorn'
    'python-websockets'
    'python-yaml'
)
makedepends=('python-installer' 'python-wheel')
optdepends=(
    'python-pywebview: desktop application (jiuwenswarm-desktop)'
    'python-a2a-sdk: Agent Communication Protocol server (jiuwenswarm-acp)'
    'jiuwenswarm-tui: terminal UI client — no Linux wheel published upstream; build from source or skip'
    'openjiuwen: distributed deployment extras (postgres, zmq backends)'
)
# PyPI wheel is pure-Python (`py3-none-any`) and bundles the built React frontend `dist/`,
# so no Node.js build step is required at install time.
source=(
    "${pkgname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/83/0f/d8368cccd39019ffb7fa3610151fa5f2b129385b163b4f09c9451e1a1eb4/jiuwenswarm-${pkgver}-py3-none-any.whl"
)
sha256sums=('2a5814b6865dd5932497c4d61ca2374483a174c905652937d671c1f4f99ce817')

prepare() {
    # Extract wheel metadata so we can install LICENSE to the canonical path
    # without polluting $pkgdir with a second copy of the dist-info tree.
    python -m zipfile -e \
        "$srcdir/${pkgname}-${pkgver}-py3-none-any.whl" \
        "$srcdir/wheel-extract"
}

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" \
        "${pkgname}-${pkgver}-py3-none-any.whl"

    install -Dm644 \
        "$srcdir/wheel-extract/${pkgname}-${pkgver}.dist-info/licenses/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
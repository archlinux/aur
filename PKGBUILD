# Maintainer: enihcam <enihcam@noreply.gitcode.com>

pkgname=python-jiuwenswarm
pkgver=0.2.2
pkgrel=3
pkgdesc="Open-source multi-agent orchestration framework (Python backend + bundled React frontend + native TUI built from source)"
arch=('x86_64')
url="https://pypi.org/project/jiuwenswarm/"
license=('Apache-2.0')
# Requires Python 3.11–3.13 (per upstream Requires-Python: >=3.11,<3.14).
# Arch `python` is currently on 3.13 at time of writing — safe.
depends=(
    'python>=3.11'
    'python-aiosqlite'
    'python-charset-normalizer'
    'python-chromadb'
    'python-croniter'
    'python-discord'
    'python-dingtalk-stream'
    'python-dotenv'
    'faiss-cpu'                 # provides faiss lib (no python- prefix in Arch)
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
    'python-requests'
    'python-ruamel-yaml'
    'python-sqlite-vec'
    'python-telegram-bot'
    'python-tree-sitter'
    'python-tree-sitter-bash'
    'python-urllib3'
    'uvicorn'                   # extra/uvicorn (no python- prefix in Arch)
    'python-websockets'
    'python-yaml'
    'icu'                       # libicui18n/libicuuc/libicudata needed by TUI native binary
)
makedepends=(
    'bun'                  # compiles TUI TypeScript into a self-contained native binary
    'nodejs'               # npm ci for TUI JS runtime deps
    'python-build'         # python -m build --wheel for the TUI Python wheel
    'python-installer'     # python -m installer to copy wheels into $pkgdir
    'python-wheel'         # required by python -m build
    'git'                  # base-devel; needed for git+https:// source
)
optdepends=(
    'python-a2a-sdk-fastapi: highly recommended - A2A HTTP server transport, required by jiuwenswarm-acp (the a2a-sdk[http-server] extra)'
    'python-a2a-sdk: A2A protocol SDK runtime (needed alongside python-a2a-sdk-fastapi for jiuwenswarm-acp)'
    'python-pywebview: desktop application GUI (jiuwenswarm-desktop)'
    'openjiuwen: distributed deployment extras (postgres, zmq backends)'
)
# The real jiuwenswarm-tui (TypeScript-based interactive terminal client built with Bun)
# is no longer an optdepend — it is built from source and bundled in this package.
#
# Source 1: PyPI wheel. Pure-Python (`py3-none-any`), bundles the built React frontend
#   `dist/`, so no Node.js build step is required for the main package at install time.
#   Local filename must match the wheel's internal .dist-info directory name
#   (jiuwenswarm-${pkgver}.dist-info). Using ${pkgname}- prefix breaks
#   python -m installer's filename-to-dist-info check.
#
# Source 2: Upstream git tag. The tag for v0.2.2 on gitcode is named "JiuwenSwarm0.2.2"
#   (no `v` prefix, capital `J`). Provides:
#     - jiuwenswarm/channels/tui/frontend/    (TypeScript source + package.json + package-lock.json)
#     - packages/jiuwenswarm-tui/              (Python wrapper package + setup.py + pyproject.toml)
#     - scripts/build_tui.py                   (Bun --compile script)
# Git sources are inherently unstable so checksum is SKIP; pin by commit in a follow-up.
_tag="JiuwenSwarm${pkgver}"
source=(
    "jiuwenswarm-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/83/0f/d8368cccd39019ffb7fa3610151fa5f2b129385b163b4f09c9451e1a1eb4/jiuwenswarm-${pkgver}-py3-none-any.whl"
    "${_tag}.tar.gz::git+https://gitcode.com/openJiuwen/jiuwenswarm.git#tag=${_tag}"
)
sha256sums=(
    '2a5814b6865dd5932497c4d61ca2374483a174c905652937d671c1f4f99ce817'  # main PyPI wheel
    'SKIP'                                                                # git tag, verified via git fetch + checkout
)

prepare() {
    cd "$srcdir/${_tag}.tar.gz"

    # Extract main wheel metadata so we can install LICENSE to the canonical path
    # without polluting $pkgdir with a second copy of the dist-info tree.
    python -m zipfile -e \
        "$srcdir/jiuwenswarm-${pkgver}-py3-none-any.whl" \
        "$srcdir/wheel-extract"

    # Install TUI JS runtime dependencies (chalk, ws, @mariozechner/pi-tui).
    # Skip devDependencies (typescript, oxlint, oxfmt) — not needed for the build.
    # The upstream package-lock.json pins to registry.npmmirror.com — force the
    # official npmjs.org registry so AUR users worldwide can build without
    # depending on a third-party mirror.
    # `--allow-remote=all` is required by npm >=11 which defaults to allow-remote=none
    # to block remote package fetches.
    pushd "jiuwenswarm/channels/tui/frontend" >/dev/null
    npm ci --omit=dev \
        --allow-remote=all \
        --registry=https://registry.npmjs.org/
    popd >/dev/null

    # Compile TUI TypeScript into a self-contained native binary via Bun.
    # scripts/build_tui.py writes the binary to
    #   packages/jiuwenswarm-tui/jiuwenswarm_tui/resources/tui-bin/<platform>/jiuwenswarm-tui
    # so the TUI Python wrapper package picks it up at install time.
    python scripts/build_tui.py --target current

    # Build the TUI Python wheel (which now bundles the native binary inside).
    # --no-isolation reuses the system Python's build/wheel/setuptools (faster, no venv).
    pushd "packages/jiuwenswarm-tui" >/dev/null
    python -m build --wheel --no-isolation
    popd >/dev/null
}

package() {
    cd "$srcdir"

    # Install main wheel first (contains the `jiuwenswarm-tui` CLI subcommand dispatcher).
    python -m installer --destdir="$pkgdir" \
        "jiuwenswarm-${pkgver}-py3-none-any.whl"

    # Install TUI wheel LAST with --overwrite-existing so the real launcher
    # (jiuwenswarm_tui.app:main) replaces the bundled CLI dispatcher under
    # the same /usr/bin/jiuwenswarm-tui path.
    python -m installer --destdir="$pkgdir" --overwrite-existing \
        "${_tag}.tar.gz/packages/jiuwenswarm-tui/dist/"*.whl

    # Install upstream LICENSE into the canonical Arch location.
    install -Dm644 \
        "$srcdir/wheel-extract/jiuwenswarm-${pkgver}.dist-info/licenses/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
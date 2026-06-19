# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=marimo
pkgver=0.23.10
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://github.com/marimo-team/marimo'
license=('Apache-2.0')
options=(!debug)

makedepends=(
    # Frontend build tools - required for GitHub source
    # 'nodejs'
    # 'pnpm'
    
    'python-installer'
    'uv'
)

depends=(
    'python-click'
    'python-jedi'
    'python-markdown'
    'python-pymdown-extensions'
    'python-pygments'
    'python-tomlkit'
    'python-yaml'
    'uvicorn'
    'python-starlette'
    'python-multipart'
    'python-websockets'
    'python-loro'
    'python-docutils'
    'python-psutil'
    'python-itsdangerous'
    'python-narwhals'
    'python-packaging'
    'python-msgspec'
    'python-pyzmq'
)

optdepends=(
    # LSP
    'python-lsp-server: LSP server'
    'python-lsp-ruff: LSP server'

    # Sandbox (marimo edit --sandbox DIRECTORY)
    'uv: Sandbox management'

    # SQL
    'python-duckdb: SQL cells support'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'

    # MCP
    'python-mcp: MCP support'
    'python-pydantic: MCP support'

    # OpenTelemetry
    'python-opentelemetry-api: For tracing debugging'
    'python-opentelemetry-sdk: For tracing debugging'
    'python-opentelemetry-exporter-otlp-proto-http: For tracing debugging'
    'python-opentelemetry-exporter-otlp-proto-grpc: For tracing debugging'

    # Others
    'python-altair: Plotting in datasource viewer'
    'python-pydantic-ai-slim: AI features'
    'jupyter-nbformat: Export as IPYNB'
    'ruff: Formatting'
)

# GitHub source
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
# b2sums=('c26640fa34a4717e2f8b9b3bd60161c1f7e17e38b90b0b49af081e1feeea6e69eedcf53aa84e5165ae0d25a3141653e9cda30f7f9449ac435c89352ef0572900')

# PyPI source release
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
b2sums=('74e3b9d93c0b21a7c3945a67dc60171fcfdaea52494b1bd859d9843a7b3db88b76891f9ddf231ed491193517211eccf4210bd62cb9061a5b4e99dc6377000dc5')

build() {
    cd $pkgname-$pkgver

    # Build frontend - required for GitHub source
    # make fe

    uv build --wheel \
        -p /usr/bin/python3 \
        --cache-dir build_cache \
        --clear -o dist
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
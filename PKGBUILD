# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=marimo
pkgver=0.25.1
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
    'uv: Sandbox management and local html-wasm exports'

    # SQL
    'python-duckdb: SQL cells support'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'

    # MCP
    'python-mcp: MCP support'
    'python-httpx2: MCP support'

    # OpenTelemetry
    'python-opentelemetry-api: For tracing debugging'
    'python-opentelemetry-sdk: For tracing debugging'
    'python-opentelemetry-exporter-otlp-proto-http: For tracing debugging'
    'python-opentelemetry-exporter-otlp-proto-grpc: For tracing debugging'

    # Others
    'python-altair: Plotting in datasource viewer'
    'python-cryptography: Ed25519 signing of persistent cache manifests'
    'python-pydantic-ai-slim: AI features'
    'jupyter-nbformat: Export as IPYNB'
    'ruff: Formatting'
    'marimo-lens: Inspect and select notebook outputs'
)

# GitHub source
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
# b2sums=('c26640fa34a4717e2f8b9b3bd60161c1f7e17e38b90b0b49af081e1feeea6e69eedcf53aa84e5165ae0d25a3141653e9cda30f7f9449ac435c89352ef0572900')

# PyPI source release
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
b2sums=('d603e2ce5a2cf342179d0028ea959a00e3a45310c618b340cbdfc149f939cac13f2c11d12afde78a8db22b60f02e1abbd0c1f76f94d9b6c98c7a5cbe69c52b1a')

build() {
    cd $pkgname-$pkgver

    # Build frontend - required for GitHub source
    # make fe

    uv build --wheel \
        -p /usr/bin/python3 \
        --cache-dir "${srcdir}/build_cache" \
        --clear -o dist
    rm -rf "${srcdir}/build_cache"
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Shell completions

    install -dm0755 "${pkgdir}/usr/share/bash-completion/completions/"
    install -dm0755 "${pkgdir}/usr/share/zsh/site-functions/"
    install -dm0755 "${pkgdir}/usr/share/fish/vendor_completions.d/"

    PYTHONPATH+="${srcdir}/marimo:"

    PYTHONPATH=${PYTHONPATH} _MARIMO_COMPLETE=bash_source "$pkgdir"/usr/bin/marimo > "${pkgdir}/usr/share/bash-completion/completions/marimo"
    PYTHONPATH=${PYTHONPATH} _MARIMO_COMPLETE=zsh_source "$pkgdir"/usr/bin/marimo > "${pkgdir}/usr/share/zsh/site-functions/_marimo"
    PYTHONPATH=${PYTHONPATH} _MARIMO_COMPLETE=fish_source "$pkgdir"/usr/bin/marimo > "${pkgdir}/usr/share/fish/vendor_completions.d/marimo.fish"
}
# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=marimo
pkgver=0.19.10
pkgrel=1
pkgdesc="A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps"
arch=(any)
url='https://github.com/marimo-team/marimo'
license=('Apache-2.0')
options=(!debug)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'

    # Pending uv_build>0.10.x support
    # 'python-uv-build'
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
    'python-websockets'
    'python-docutils'
    'python-psutil'
    'python-itsdangerous'
    'python-narwhals'
    'python-packaging'
    'python-msgspec'
    'python-openai'
)

optdepends=(
    # LSP
    'python-lsp-server: LSP server'
    'python-lsp-ruff: LSP server'

    # Sandbox (marimo edit --sandbox DIRECTORY)
    'python-pyzmq: IPC communication for sandbox kernels'
    'uv: Sandbox management'

    # SQL
    'python-duckdb: SQL cells support'
    'python-polars: SQL output back in Python'
    'python-sqlglot: SQL cells parsing'

    # Others
    'python-altair: Plotting in datasource viewer'
    'python-pydantic-ai-slim: AI features'
    'jupyter-nbformat: Export as IPYNB'
    'ruff: Formatting'
)

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
sha256sums=('a4fad325b8c5e7aef77c21d62764c20899c352dfa1afbc44c30760ae081d2b27')

build() {
    cd $pkgname-$pkgver
    # python -m build --wheel --no-isolation

    # Pending uv_build>0.10.x support
    rm -rf build_venv
    python -m venv --system-site-packages build_venv
    build_venv/bin/python -m pip install 'uv-build==0.9.30'
    build_venv/bin/python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
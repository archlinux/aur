# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp-pro
_name=${pkgname#python-}
pkgver=3.7.5
pkgrel=1
pkgdesc="A Model Context Protocol server for KiCad EDA workflows"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/oaslananka/kicad-mcp"
_pydeps=(
    authlib
    anyio
    click
    opentelemetry-api
    opentelemetry-exporter-otlp
    opentelemetry-sdk
    pydantic
    pydantic-settings
    rich
    starlette
    structlog
    urllib3
    typer
    yaml

    # AUR
    kicad
    kicad-sch-api
    mcp
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'kicad'
    'python-numpy: simulation'
    'python-httpx: http'
    'uvicorn: http'
    'python-gitpython: vcs'
    'docker: freerouting'
    'freerouting'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('f99cd3a47167ff707c98cd8f0644516dea29191a804b524e652719972eef2bba')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

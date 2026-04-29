# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp-pro
_name=${pkgname#python-}
pkgver=3.1.6
pkgrel=1
pkgdesc="A professional Model Context Protocol server for KiCad EDA"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/oaslananka/kicad-mcp-pro"
_pydeps=(
    authlib
    anyio
    pydantic
    pydantic-settings
    rich
    starlette
    structlog
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
sha256sums=('de1b0a20b19def9bafb706fc1f02a01eddfae9204357000c6ae3e89f885c1b01')

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

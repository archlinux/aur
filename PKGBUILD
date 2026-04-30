# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp-pro
_name=${pkgname#python-}
pkgver=3.1.8
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
sha256sums=('8cd5231e5aae4dae8a2927d2529971dac3be5c267495a17996307c81f206f1de')

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

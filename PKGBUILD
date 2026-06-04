# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp-pro
_name=${pkgname#python-}
pkgver=3.7.3
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
sha256sums=('473145c30cf897d11b417d574bc3c82b7427bc42455c599860c2487dabd5373a')

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

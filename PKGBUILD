# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp-pro
_name=${pkgname#python-}
pkgver=4.11.0
pkgrel=1
pkgdesc="A Model Context Protocol server for KiCad EDA workflows"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/oaslananka/kicad-mcp-pro"
_pydeps=(
    anyio
    cairosvg
    click
    cryptography
    dotenv
    httpx
    opentelemetry-api
    opentelemetry-exporter-otlp
    opentelemetry-sdk
    packaging
    pillow
    pydantic
    pydantic-settings
    pystray
    rich
    sexpdata
    starlette
    structlog
    urllib3
    typer
    watchfiles
    websockets
    yaml
    
    # AUR
    kicad
    kicad-sch-api
    mcp
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
    uvicorn
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
    'python-gitpython: vcs'
    'docker: freerouting'
    'freerouting'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=kicad-mcp-gui-v$pkgver")
sha256sums=('5a28680182da458d15dfac146308ee375c52aaa825fae783a16740a8bd212260')

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

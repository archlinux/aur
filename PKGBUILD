# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-sch-api
_name=${pkgname#python-}
pkgver=0.5.4
pkgrel=1
pkgdesc="Professional KiCAD schematic manipulation library with exact format preservation"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/circuit-synth/kicad-sch-api"
_pydeps=(
    black
    jinja
    pydantic
    typing_extensions
# AUR
    fastmcp
    mcp
    sexpdata
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=('kicad')
license=('MIT')
source=(
    "${_name}::git+${url}.git#tag=v$pkgver"
)
sha256sums=('a81215a99699d56af324a67de1823374c659a8e91b188a0dfcaed21b54e6f50d')

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

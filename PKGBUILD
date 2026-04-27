# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-sch-api
_name=${pkgname#python-}
pkgver=0.5.3
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
sha256sums=('75c7ff8844c36bccc54e1d286e2183bde37254eff010fbf25114426e92a99c02')

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

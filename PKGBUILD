# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jbom
_name=${pkgname#python-}
pkgver=7.10.1
pkgrel=1
pkgdesc="Intelligent KiCad Bill of Materials generator with inventory matching"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/plocher/jBOM"
_pydeps=(
    numbers-parser
    sexpdata

    openpyxl
    pydantic
    requests
    wxpython
    yaml
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('01efabc832f2241f034ce6b295c46351c26734f0efa4e2768a77b8f68868de83')

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

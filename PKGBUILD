# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jbom
_name=${pkgname#python-}
pkgver=7.3.3
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
sha256sums=('42fec6bb19a06b41f7dae16cda2dcfb53f30126aa80ff70e2b5847f13c962649')

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

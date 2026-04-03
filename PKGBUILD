# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jbom
_name=${pkgname#python-}
pkgver=6.49.0
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
    requests
    yaml
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
optdepends=('kicad')
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('d769c5bf9eb146e0b236465b949f147ebfac47c5aad7544fc85de63db5fc1aea')

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

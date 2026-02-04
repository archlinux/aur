# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-jlc-manager
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Project-local JLC component library manager for KiCad"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/peterb154/kicad-jlc-manager"
_pydeps=(
    click
    jlc2kicadlib
    requests
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    uv
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('2482acf73c8340032dbb86ac200bab62a8f5a5a6cd0bd928886877bdcba29912')

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

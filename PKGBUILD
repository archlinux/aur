# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wifit3
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="A standalone USB Wi-Fi auditor"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/derv82/wifit3"
_pydeps=(
    platformdirs
    pyusb
    rich
    textual
    zstandard

    libusb-package
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=()
license=('GPL-2.0-only')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('3ec8c14bc98fac6bd5885fac79e6eabc8ec8a7cbc722a1e69dbfa20b9af8f277')

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
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

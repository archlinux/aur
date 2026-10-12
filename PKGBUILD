# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-wifit3
_name=${pkgname#python-}
pkgver=0.4.4
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
sha256sums=('f750e04cd8423eec418bc37517a863d592c7ac9d82172159bb9dd917127398fb')

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

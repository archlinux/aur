# Maintainer: Karol Babioch <karol@babioch.de

pkgname=libfido2-git
_pkgname=${pkgname%-git}
pkgver=0.3.0.r11.3fff6b5
pkgrel=1
pkgdesc="Provides library functionality for FIDO 2.0, including communication with a device over USB"
arch=('x86_64')
url="https://developers.yubico.com/libfido2/"
license=('BSD')
depends=('openssl' 'libcbor' 'hidapi')
makedepends=('git' 'cmake')
source=("git+https://github.com/Yubico/libfido2.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  mkdir build
}

build() {
    cd "$srcdir/${_pkgname}/build"
    cmake .. \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

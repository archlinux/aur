# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bctoolbox-git
_pkgname=bctoolbox
pkgver=5.3.0.alpha.r40.g6a403ee
pkgrel=1
pkgdesc="Utilities library for Belledonne Communications software"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('bctoolbox')
provides=('bctoolbox=$pkgver')
depends=('libdecaf' 'mbedtls')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_TESTS_COMPONENT="NO" \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=unused-parameter" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_SHARED_LIBS=YES \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

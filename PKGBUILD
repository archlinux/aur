# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bctoolbox-git
_pkgname=bctoolbox
pkgver=5.3.0.alpha.r10.gb0027df
pkgrel=1
pkgdesc="Utilities library for Belledonne Communications software"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('bctoolbox')
provides=('bctoolbox=$pkgver')
depends=('bcunit>=3.0.2+12' 'libdecaf' 'mbedtls')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC="NO" \
    -DENABLE_TESTS="YES" \
    -DENABLE_TESTS_COMPONENT="YES" \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=unused-parameter" \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# $Id$
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bctoolbox-git
_pkgname=bctoolbox
pkgver=0.6.0.r87.g934484a
pkgrel=1
pkgdesc="Utilities library for Belledonne Communications software"
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('bctoolbox')
provides=('bctoolbox')
depends=('libdecaf' 'mbedtls')
makedepends=('cmake' 'git')
source=("git://github.com/BelledonneCommunications/$_pkgname.git"
    "stringop-truncation.patch::https://patch-diff.githubusercontent.com/raw/BelledonneCommunications/bctoolbox/pull/5.patch")
sha256sums=('SKIP'
            '614c919c46efb7e70a3dba3991741db2816784673dc6f35d26b9828163b1af07')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    patch -p1 < ../stringop-truncation.patch
}

build() {
  mkdir -p build
  cd build
  cmake -DENABLE_TESTS_COMPONENT=NO \
      -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" "../$_pkgname" \
      -DENABLE_STATIC="NO"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

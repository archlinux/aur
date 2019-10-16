# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=librsync
pkgname=lib32-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc="Library for calculating and applying network deltas (32-bit)"
arch=('x86_64')
url="http://librsync.sourcefrog.net/"
license=('LGPL')
depends=('lib32-popt' 'lib32-bzip2' 'lib32-zlib' 'librsync')
makedepends=('cmake' 'gcc-multilib')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b5ab8e2092b82b7d7bb9c1dd52e6a77083a89f8ad9b9309da611f490d0b49a71')

prepare() {
  if [[ -d ${srcdir}/build ]]; then
    rm -rf ${srcdir}/build
  fi
  mkdir -p ${srcdir}/build
}

build() {
  cd "${srcdir}/build"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    ../${_pkgname}-${pkgver}
  make
}

check() {
  cd "${srcdir}/build"
  make -k check || true
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

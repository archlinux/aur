# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=librsync
pkgname=lib32-${_pkgname}
pkgver=2.0.2
pkgrel=1
pkgdesc="Library for calculating and applying network deltas (32-bit)"
arch=('x86_64')
url="http://librsync.sourcefrog.net/"
license=('LGPL')
depends=('lib32-popt' 'lib32-bzip2' 'lib32-zlib' 'librsync')
makedepends=('cmake' 'lib32-gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e67b9520ee84f7239be6e948795803bd95495091cc00bf6d0e8c6976032a4af1')

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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    ../${_pkgname}-${pkgver}
  make
}

check() {
  cd "${srcdir}/build"
  make -k check
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

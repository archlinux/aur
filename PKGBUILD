# Maintainer: robertfoster
pkgname=smpq
pkgver=1.6
pkgrel=1
pkgdesc="StormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ archives"
arch=('i686' 'x86_64')
url="https://launchpad.net/smpq"
license=('GPL3')
depends=('stormlib')
makedepends=('cmake')
source=("https://launchpad.net/smpq/trunk/${pkgver}/+download/smpq_${pkgver}.orig.tar.gz")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Do not generate the manual
  sed -i 's|if(NOT CMAKE_CROSSCOMPILING)|if(FALSE)|' CMakeLists.txt
  sed -i '/^project/a file(GLOB_RECURSE CFILES "${CMAKE_SOURCE_DIR}/*.c")\
SET_SOURCE_FILES_PROPERTIES(${CFILES} PROPERTIES LANGUAGE CXX)' CMakeLists.txt
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  cmake -DWITH_KDE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSTORMLIB_INCLUDE_DIR=/usr/include ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  cd build
  make DESTDIR="$pkgdir/" install
}

sha256sums=('b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb')

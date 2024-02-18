# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=taglib1
_name=taglib
pkgver=1.13.1
pkgrel=2
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats - version 1"
arch=(x86_64)
url="https://taglib.org/"
_url="https://github.com/taglib/taglib"
license=(
  LGPL-2.1-only
  MPL-1.1
)
depends=(
  gcc-libs
  glibc
  sh
  zlib
)
makedepends=(
  cmake
  utf8cpp
)
checkdepends=(cppunit)
source=($_url/releases/download/v$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('986231ee62caa975afead7e94630d58acaac25a38bc33d4493d51bd635d79336e81bba60586d7355ebc0670e31f28d32da3ecceaf33292e4bc240c64bf00f35b')
b2sums=('36cf9b59ded95c9996d04a86055a36a7b74a2a01c13f75826d4907abca0b982c5f9b0e4bcd6648707013108f8eaf424ab95f07c383130452aa169e2cab33f466')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_INCLUDEDIR=include/$pkgname
    -D CMAKE_INSTALL_LIBDIR=lib/$pkgname
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
    -S $_name-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv -v "$pkgdir/usr/bin/"taglib{,1}-config
  ln -sv "$pkgname/libtag.so.1" "$pkgdir/usr/lib/libtag.so.1"
  ln -sv "$pkgname/libtag_c.so.0" "$pkgdir/usr/lib/libtag_c.so.0"
}

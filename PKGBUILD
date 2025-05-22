# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.7
pkgrel=1
pkgdesc="Instrument file software library"
arch=(x86_64)
url="https://github.com/swami/libinstpatch"
license=(LGPL-2.1-only)
depends=(
  lib32-gcc-libs
  lib32-glibc
  "libinstpatch=$pkgver"
)
makedepends=(
  cmake
  glib2-devel
  lib32-glib2
  lib32-libsndfile
  python
)
provides=(libinstpatch-1.0.so)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
b2sums=('7e78b0f868cd805a3633eeecbbd0b70b1d7f344372a96b0c08b1beabf5596a2d768db30499e802ab53ce22fa05e457c26b2d24d5f29285040807dc0d54a0d10e')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=/usr/lib32
    -S $_name-$pkgver
    -Wno-dev
  )

  export CFLAGS+=" $CPPFLAGS"
  export CXXFLAGS+=" $CPPFLAGS"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  depends+=(
    lib32-glib2 libglib-2.0.so libgobject-2.0.so
    lib32-libsndfile libsndfile.so
  )

  DESTDIR="$pkgdir" cmake --install build
  rm -rf "$pkgdir/usr/include"
}

# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libinstpatch
pkgname=lib32-libinstpatch
pkgver=1.1.6
pkgrel=2
pkgdesc="Instrument file software library"
arch=(x86_64)
url="https://github.com/swami/libinstpatch"
license=(LGPL2.1)
depends=(
  lib32-gcc-libs
  lib32-glibc
  "libinstpatch=$pkgver"
)
makedepends=(
  cmake
  lib32-glib2
  lib32-libsndfile
  python
)
provides=(libinstpatch-1.0.so)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('0e22165fc3c045bbc3ab2e1c090728232ed9142797ddbd067b682b9bcfee93850deb76c23b78f49a776e3d099be25fa029673ce8e4a909b2f48860dcdc55803c')
b2sums=('c5881e6559a7fbcb40e1c43c7dbbfc1df9ac9445e83c70044855c192c3b04945ae125c0e06253ba76d3922a1f8fc6965810700ed57018864b319076ee9528d55')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D LIB_INSTALL_DIR=/usr/lib32
    -D LIB_SUFFIX=32
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

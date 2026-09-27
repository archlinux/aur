# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=libraw-cmake
pkgver=r63.eb98e43
_libraw_cmake_commit=eb98e4325aef2ce85d2eb031c2ff18640ca616d3
_libraw_version=0.22.2
pkgrel=1
arch=('any')
pkgdesc="LibRaw configuration files for CMake"
url="https://github.com/LibRaw/LibRaw-cmake"
license=('BSD-3-Clause-Tso')
depends=('cmake')
makedepends=('glibc' 'lcms2' 'libgcc' 'libgomp' 'libjpeg-turbo' 'libstdc++' 'zlib')
source=("LibRaw-cmake-$_libraw_cmake_commit.tar.gz::$url/archive/$_libraw_cmake_commit.tar.gz"
        "LibRaw-$_libraw_version.tar.gz::https://codeload.github.com/LibRaw/LibRaw/tar.gz/refs/tags/0.22.2")
b2sums=('SKIP'
        '48e881ae2eb20c273e25f1ebc36e3ddbf0d255af8e5693cd515262cb1d66ac7e444064baa629cf7bc0a19057afe3b4ba045257589bc08afc5c0fc2b28193f377')

prepare() {
  mv LibRaw-cmake-$_libraw_cmake_commit/* LibRaw-$_libraw_version
}

build() {
  cmake LibRaw-$_libraw_version \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build/
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  for files in \
    'bin' \
    'include' \
    'lib/libraw*' \
    'lib/pkgconfig' \
    'share/doc'
  do
    rm -fr $pkgdir/usr/$files
  done

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/LibRaw-$_libraw_version/LICENSE" \
          -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephbr <rafael.f.f1@gmail.com>

_pkgbase=physfs
pkgname=lib32-$_pkgbase
pkgver=2.0.3
pkgrel=3
pkgdesc="A library to provide abstract access to various archives (32 bit)"
arch=('x86_64')
url="http://icculus.org/physfs/"
license=('custom')
depends=('lib32-zlib' "$_pkgbase=$pkgver")
makedepends=('cmake' 'gcc-multilib')
source=("${url}downloads/$_pkgbase-$pkgver.tar.bz2")
sha256sums=('ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69')

build() {
  cd $_pkgbase-$pkgver

  rm -rf build
  mkdir build && cd build

  export CFLAGS="$CFLAGS -m32 -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -m32 -fno-strict-aliasing"

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DPHYSFS_BUILD_TEST=OFF \
    -DPHYSFS_BUILD_WX_TEST=OFF \
    -DPHYSFS_BUILD_STATIC=OFF \
    -DLIB_SUFFIX=32
  make
}

package() {
  cd $_pkgbase-$pkgver

  make -C build DESTDIR="$pkgdir/" install

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}

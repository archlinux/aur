# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: josephbr <rafael.f.f1@gmail.com>

pkgname=lib32-physfs
pkgver=3.0.2
pkgrel=1
pkgdesc="A library to provide abstract access to various archives (32 bit)"
arch=('x86_64')
url="https://icculus.org/physfs/"
license=('custom: zlib')
depends=('physfs' 'lib32-glibc')
makedepends=('cmake' 'gcc-multilib')
source=("${url}downloads/physfs-$pkgver.tar.bz2")
sha256sums=('304df76206d633df5360e738b138c94e82ccf086e50ba84f456d3f8432f9f863')

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build

  export CC="gcc -m32"
  export CXX="g++ -m32"

  cmake ../physfs-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHYSFS_BUILD_TEST=OFF \
    -DPHYSFS_BUILD_STATIC=OFF \
    -DLIB_SUFFIX=32
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  # fixup pkg-config file
  sed 's|^libdir.*lib$|&32|' -i "$pkgdir"/usr/lib32/pkgconfig/physfs.pc

  # remove header file
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s physfs "$pkgdir"/usr/share/licenses/$pkgname
}

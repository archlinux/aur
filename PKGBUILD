# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=librtprocess
pkgver=0.11.0
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Library for raw image processing"
url="https://github.com/CarVac/librtprocess"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'openmp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('49f1d4c3c8915fec60e554fff2d6d7e821778217ecabb4f9c49438101ecf9bf6ecbd55cd6dda5efd69106d841d3bb47a9cb4497880923395e7aa621cce4a0f8d')

prepare() {
  cd $pkgname-$pkgver
  if [ -d build ]
  then
    rm -rf build
  fi

  mkdir build

  # Fix build in GCC 11
  # https://github.com/CarVac/librtprocess/pull/62
  sed -i '/functional/a #include <cstddef>' \
          src/include/librtprocess.h
}

build() {
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
	..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

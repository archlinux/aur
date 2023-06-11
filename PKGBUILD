# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kube
pkgver=0.9.0
pkgrel=2
pkgdesc='A modern groupware client based on QtQuick and Sink'
arch=(x86_64)
url='https://kube.kde.org/'
license=(LGPL)
depends=(sink gpgme sonnet qt5-quickcontrols2 qt5-webengine qt5-quickcontrols)
makedepends=(extra-cmake-modules)
#source=(https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
source=(https://invent.kde.org/pim/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('75e6c0d1b04328eb2ada0ceea656753aa1a94361b94feaf81003733470400a63')

prepare() {
  sed -e 's|CMAKE_CXX_STANDARD 20|CMAKE_CXX_STANDARD 17|' -i $pkgname-v$pkgver/CMakeLists.txt # Fix build
  find . -name CMakeLists.txt | xargs sed -e '/tests/d' -i # Don't build tests
}

build() {
  cmake -B build -S $pkgname-v$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

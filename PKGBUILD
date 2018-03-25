# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=xeus
pkgver=0.11.0
pkgrel=1
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepend=('cmake')
source=(
  "$pkgname.tar.gz::https://github.com/QuantStack/xeus/archive/{$pkgver}.tar.gz"
  "https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq_addon.hpp"
  'Findcppzmq.cmake'
  'Findcryptopp.cmake'
  'FindZeroMQ.cmake'
  'package.patch')
sha256sums=('479bf8ed915d325efe3b237697b50d8113f74928130a35be7f44dce87912d7a8'
            'f3ad054859fa34c214f25d850c3103816c63b835f3c34a753e878b87307ea945'
            '9f2f6f73af088945f0c6610d6e3024083b7dee89b0f5df2d816cd7925564108e'
            '1b00b80c30a17d917ce5374d870e15f5a5fa60e1120b1c485b87e4b88ef6f0f3'
            'c0d3f386032d07adcf3ee9a39cfc8df643f182d2b1190c1e7e4a3014a4f01a04'
            'fd016c48aad15e7425705c0412fa811240c3a3a055dc25a0c0cb20d23fa0111a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../package.patch
  cp ../../zmq_addon.hpp include
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_MODULE_PATH=$PWD/../.. ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=xeus
pkgver=0.18.1
pkgrel=1
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepend=('cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz"
  "https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq_addon.hpp"
  'Findcppzmq.cmake'
  'Findcryptopp.cmake'
  'FindZeroMQ.cmake'
  'package.patch')
sha256sums=('b2bf124d015399ba5a40bc77b80254c9217944223295a8b9b764ec179d0e4b9a'
            'bcb34c2cd5393673679c46034ad7ae882206d68321e3b4532b895dc666139a34'
            '9f2f6f73af088945f0c6610d6e3024083b7dee89b0f5df2d816cd7925564108e'
            '1b00b80c30a17d917ce5374d870e15f5a5fa60e1120b1c485b87e4b88ef6f0f3'
            'c0d3f386032d07adcf3ee9a39cfc8df643f182d2b1190c1e7e4a3014a4f01a04'
            '4886a128fcb62f0591c9a5566e574e8a93dc086486ea7f2e52529b2b643bc04f')

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

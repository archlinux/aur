# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.7.3
_octagramcommit=f92e083052b9983ee3cbddcda5ed60bb3c068e24
_luacommit=d45a41af2f9d731e3c1516a191cc3160e3cb8377
_charcodecommit=b569184772b12965e3ebe1dfd431026951fed81c
pkgrel=15
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'capnproto' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('cmake' 'boost' 'gtest' 'ninja')
source=("https://github.com/rime/librime/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/lotem/librime-octagram/archive/$_octagramcommit/librime-octagram-$_octagramcommit.tar.gz"
        "https://github.com/hchunhui/librime-lua/archive/$_luacommit/librime-lua-$_luacommit.tar.gz"
        "https://github.com/rime/librime-charcode/archive/$_charcodecommit/librime-lua-$_charcodecommit.tar.gz"
        cmath-include.patch)
sha512sums=('8767d17c3d14a5a1bbb8269fab1627b907de72c288b362fdbc6191223937da21e8b18471b4ae8f83ce5afc0ec5c3ab12fbcb49930eb9969c1764c7390d9ee4b0'
            '737d1c58982d2f79a6e8b2548eefa1dddc036dd6e6d5436e7d6b4f3adfa2e9d8e45b29a13c1b8207a93cb77f3b5dbd9d18436f44d4e8040eb95b962de582b386'
            '2a3d3b49d53066fe96dd008e8064718082225e6bf185574a25b8e98175d9936abcfa1fdc56e48f9c72a2deb46f8157d6132fd119ff8e0a3d52fbe9e2ea21386c'
            '6670a2b089479cf4fb23012e61675065d483ab6123f6dcad136b226dbe361a16bc8f33caece2e139c8d89161a73a2126afe2bed3759996153de6e4888a95a430'
            '531b4143a7636e6f2cdb67ed2d9b6aa5d43c50dfbbad626757b435debf863f9d466a5923611d9213b0c897af919870d367e88889ea2bbc1037e11fa88a0c7602')

prepare() {
  cd $pkgname-$pkgver/plugins
  ln -sf "$srcdir"/librime-octagram-$_octagramcommit librime-octagram
  ln -sf "$srcdir"/librime-lua-$_luacommit librime-lua
  ln -sf "$srcdir"/librime-charcode-$_charcodecommit librime-charcode

  patch -Np1 -d .. -i ../cmath-include.patch
}

build() {
  cd $pkgname-$pkgver
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -GNinja -Bbuild -DBUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname-$pkgver/build
  ninja test
}

package() {
  cd $pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}

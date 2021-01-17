# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.7.0
_octagramcommit=f92e083052b9983ee3cbddcda5ed60bb3c068e24
_luacommit=d45a41af2f9d731e3c1516a191cc3160e3cb8377
_charcodecommit=b569184772b12965e3ebe1dfd431026951fed81c
pkgrel=1
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
        "https://github.com/rime/librime-charcode/archive/$_charcodecommit/librime-lua-$_charcodecommit.tar.gz")
sha512sums=('74d1d8a97c6b1affb84f7d92b3c37f3d88163acff1118099c1d6ddf72003b39733aec7ad533e759b80e4af1be1ff1276f41be14b902f09ba2bf2e5192cac2f72'
            '737d1c58982d2f79a6e8b2548eefa1dddc036dd6e6d5436e7d6b4f3adfa2e9d8e45b29a13c1b8207a93cb77f3b5dbd9d18436f44d4e8040eb95b962de582b386'
            '2a3d3b49d53066fe96dd008e8064718082225e6bf185574a25b8e98175d9936abcfa1fdc56e48f9c72a2deb46f8157d6132fd119ff8e0a3d52fbe9e2ea21386c'
            '6670a2b089479cf4fb23012e61675065d483ab6123f6dcad136b226dbe361a16bc8f33caece2e139c8d89161a73a2126afe2bed3759996153de6e4888a95a430')

prepare() {
  cd $pkgname-$pkgver/plugins
  ln -sf "$srcdir"/librime-octagram-$_octagramcommit librime-octagram
  ln -sf "$srcdir"/librime-lua-$_luacommit librime-lua
  ln -sf "$srcdir"/librime-charcode-$_charcodecommit librime-charcode
}

build() {
  cd $pkgname-$pkgver
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On
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

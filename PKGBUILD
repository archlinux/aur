# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.6.1
_octagramcommit=3664bc9d0426397541e6dcfb7c3c7d6aaad73b2e
_luacommit=aeb1e9d76e704dd5472e70e7d3e2b25fcec93f23
_charcodecommit=8f019bcec09d010b155cea111ae72f08e68f79ca
pkgrel=2
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'capnproto' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('cmake' 'boost' 'gtest' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/$pkgver.tar.gz"
        "https://github.com/lotem/librime-octagram/archive/$_octagramcommit/librime-octagram-$_octagramcommit.tar.gz"
        "https://github.com/hchunhui/librime-lua/archive/$_luacommit/librime-lua-$_luacommit.tar.gz"
        "https://github.com/rime/librime-charcode/archive/$_charcodecommit/librime-lua-$_charcodecommit.tar.gz")
sha512sums=('944361e9459662bb97b97ce9e2651acf0beb368b3769d1b9576cf4e5c2779302cae470fa39f5bc262cabb6a0e8590bcb77d32ffc87d7385b9465869fe7d5bcb3'
            'fb8c263c25a15986c83510e8d02db4702c247089dcd1cbfa05da50357765f3839cd1081177c4aefff1091558beb4516c1808669281d0635bbf071cfda7fca8e0'
            '11646843db59c69fb6846bf7177edb52c4e77a5b920396b6e073c85bf4ec59ba94e3370fcece5f1f4d2792404b7eaac02a6289bf498b9453b730cf7517f37832'
            'f247fed1ea6956c840a65932432e1b72e5abdb6fbb68603f0582adf1099d749226045d495ec71ca018cc5802897bc9c83629e7de21fddeca462e0ee1c9167840')

prepare() {
  cd $pkgname-$pkgver/plugins
  ln -sf "$srcdir"/librime-octagram-$_octagramcommit librime-octagram
  ln -sf "$srcdir"/librime-lua-$_luacommit librime-lua
  ln -sf "$srcdir"/librime-charcode-$_charcodecommit librime-charcode
}

build() {
  cd $pkgname-$pkgver
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}

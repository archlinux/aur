# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.5.3
_octagramcommit=3664bc9d0426397541e6dcfb7c3c7d6aaad73b2e
_luacommit=aeb1e9d76e704dd5472e70e7d3e2b25fcec93f23
pkgrel=12
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('cmake' 'boost' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/$pkgver.tar.gz"
        "https://github.com/lotem/librime-octagram/archive/$_octagramcommit/librime-octagram-$_octagramcommit.tar.gz"
        "https://github.com/hchunhui/librime-lua/archive/$_luacommit/librime-lua-$_luacommit.tar.gz"
        $pkgname-opencc-1.1.patch::https://github.com/rime/librime/commit/beae5b1d4e990aeb05eb86db5eefec50fa03750b.patch)
sha512sums=('4d7f6ec43bd5728f59f0b3581bcd8a46128651430b6873017d80659942b8f6aa1a2f25f439ba8fba461fe22acbf701c2da7a786104a2e4852a70a89cdc0452d3'
            'fb8c263c25a15986c83510e8d02db4702c247089dcd1cbfa05da50357765f3839cd1081177c4aefff1091558beb4516c1808669281d0635bbf071cfda7fca8e0'
            '11646843db59c69fb6846bf7177edb52c4e77a5b920396b6e073c85bf4ec59ba94e3370fcece5f1f4d2792404b7eaac02a6289bf498b9453b730cf7517f37832'
            'e4c29f916cbee7c786262f17a475d2f645a88ef7709689df53c5e16d7ec6fe8ccbd1f9f246ef03a5f3412fa387f9db5025e1cfb7fa4bfd392a23525e28689bda')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../$pkgname-opencc-1.1.patch

  cd plugins
  ln -sf "$srcdir"/librime-octagram-$_octagramcommit librime-octagram
  ln -sf "$srcdir"/librime-lua-$_luacommit librime-lua
}

build() {
  cd $pkgname-$pkgver
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

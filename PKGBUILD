# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.8.5
_commit=08dd95f5d9282346f0d4a3e8fc6b20811dc3d063
_octagramcommit=a6ced5a1d623afed17284fbaa395dd3a8b019a14
_luacommit=03a2bd9e172549cb16c0718b2c9b68e8c5678085
_charcodecommit=e8a49f503769427f9c0b14e40b2e1f02417515b2
pkgrel=1
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'capnproto' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('git' 'cmake' 'boost' 'gtest' 'ninja')
source=("git+https://github.com/rime/librime.git#commit=$_commit"
        "git+https://github.com/lotem/librime-octagram.git#commit=$_octagramcommit"
        "git+https://github.com/hchunhui/librime-lua.git#commit=$_luacommit"
        "git+https://github.com/rime/librime-charcode.git#commit=$_charcodecommit")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd librime/plugins
  ln -sf "$srcdir"/librime-octagram
  ln -sf "$srcdir"/librime-lua
  ln -sf "$srcdir"/librime-charcode
}

build() {
  cd librime
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On -Wno-dev
  cmake --build build
}

check() {
  cd librime/build
  ninja test
}

package() {
  cd librime/build
  DESTDIR="$pkgdir" ninja install
}

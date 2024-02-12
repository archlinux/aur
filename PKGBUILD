# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.10.0
_commit=295cb2ab68f89ee9d3237c7d4b8033bda3f3b635
_octagramcommit=bd12863f45fbbd5c7db06d5ec8be8987b10253bf
_luacommit=7f3eca2ce659fc2401b8acb52bd2182b433e12b1
_charcodecommit=3709ca7a39a7c14f9e02fa00489a9850fd5a907b
_protocommit=657a923cd4c333e681dc943e6894e6f6d42d25b4
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
        "git+https://github.com/rime/librime-charcode.git#commit=$_charcodecommit"
        "git+https://github.com/lotem/librime-proto.git#commit=$_protocommit")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd librime/plugins
  ln -sf "$srcdir"/librime-octagram
  ln -sf "$srcdir"/librime-lua
  ln -sf "$srcdir"/librime-charcode
  ln -sf "$srcdir"/librime-proto
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

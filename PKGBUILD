# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime-luajit
pkgver=1.11.1
_octagramcommit=bd12863f45fbbd5c7db06d5ec8be8987b10253bf
_luacommit=7be6974b6d81c116bba39f6707dc640f6636fa4e
_charcodecommit=55e7f563e999802d41a13ba02657c1be4b2011b4
_protocommit=657a923cd4c333e681dc943e6894e6f6d42d25b4
_predictcommit=72e4d717e56c6542569c88b317700b3471164c42
pkgrel=1
epoch=1
pkgdesc="Rime input method engine, use luajit not lua"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('BSD-3-Clause')
depends=('boost-libs' 'capnproto' 'gcc-libs' 'glibc' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'luajit' 'google-glog' 'marisa')
makedepends=('git' 'cmake' 'boost' 'gtest' 'ninja')
source=("git+https://github.com/rime/librime.git#tag=$pkgver"
        "git+https://github.com/lotem/librime-octagram.git#commit=$_octagramcommit"
        "git+https://github.com/hchunhui/librime-lua.git#commit=$_luacommit"
        # https://github.com/hchunhui/librime-lua/pull/358
        "0001-add-LUA_VERSION-to-allow-users-to-choose-lua-version.patch"
        "git+https://github.com/rime/librime-charcode.git#commit=$_charcodecommit"
        "git+https://github.com/lotem/librime-proto.git#commit=$_protocommit"
        "git+https://github.com/rime/librime-predict.git#commit=$_predictcommit")
sha512sums=('69cacb28789c91446216dd8b99e6b5ca9643e478fcfb8ae0f8e6a6ea054c33c0610ec6e853b27598865d46b240205630a69ea69bb9f8e3ce6fc6528b59fd4e39'
            '3949507608cd0d840560f36fac5b4ed85a9d3f0622f6ccc412111fe0c4448e6a948a134690d75cdae8dd21adae1bc6cbc93f98e8509f524805dcd79593ab4eac'
            'c4236c5bc7faffc9b0a2eabb1dea0f70d0685699d66bf8cb389eb348be74e19b2fb72ae4c5aec46cf6ecfb33dc1ea3461d7581f1287b03dc92bbac0621b141ff'
            '4f6a64aafe082511021ba59a06e9cf9829cb1709243ccb9cec50e3e37c7e9d4d7a8642036cd4efce0a1c3f0f1e2f3d1a2f7ec420754429c88c5bd47247b14922'
            'c21a1384f7eba77afdcda4bd0cffcdfa1bc6989e009f02c685160de443f8fc658bee7def57fe93162b3d5f31d366b48271d7204b4f6e7dd057facb2787703a15'
            'e9b2aa47a87f96af97fc55686e85d905bd7bb06b633a9a318aeeea2731d87b38e50f9f821c2e68a30d58f4daaeaff97124247c1028a049ced922c6e7b4cc20ab'
            'bda356f609831da12d14b5150604f8b1edf97cad6a36d25aa1a3c353bc3f678f313801ac617cc9a19ba095c3565bd6aee34519608a0be815af38e717a80b54f2')
provides=(librime)
conflicts=(librime)
replaces=(librime)

prepare() {
  cd librime/plugins
  ln -sf "$srcdir"/librime-octagram
  ln -sf "$srcdir"/librime-lua
  cd "$srcdir"/librime-lua
  patch -p1 -i ../0001-add-LUA_VERSION-to-allow-users-to-choose-lua-version.patch
  ln -sf "$srcdir"/librime-charcode
  ln -sf "$srcdir"/librime-proto
  ln -sf "$srcdir"/librime-predict
}

build() {
  cd librime
  export CXXFLAGS="$CXXFLAGS -DNDEBUG -DGLOG_USE_GLOG_EXPORT -DGLOG_USE_GFLAGS"
  cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On -Wno-dev -DLUA_VERSION=luajit
  cmake --build build
}

check() {
  cd librime/build
  ninja test
}

package() {
  cd librime/build
  DESTDIR="$pkgdir" ninja install
  install -vDm 644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

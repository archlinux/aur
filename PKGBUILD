# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=librime-lua-git
_pkgname=librime
pkgver=1.5.3.r77.1049863
_pkgver=1.5.3
pkgrel=3
pkgdesc="Rime input method engine with Lua plugin"
arch=('x86_64')
url="https://github.com/hchunhui/librime-lua"
license=('GPL3')
depends=('librime' 'lua')
makedepends=('git' 'cmake' 'boost' 'gtest' 'boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'google-glog' 'marisa')
provides=('librime-lua.so')
#conflicts=('librime' 'librime-lua')
source=("librime-lua::git+https://github.com/hchunhui/librime-lua.git"
        "$_pkgname-$_pkgver.tar.gz::https://github.com/rime/librime/archive/$_pkgver.tar.gz"
        "$_pkgname-opencc-1.1.patch::https://github.com/rime/librime/commit/beae5b1d4e990aeb05eb86db5eefec50fa03750b.patch"
)
sha512sums=('SKIP'
    '4d7f6ec43bd5728f59f0b3581bcd8a46128651430b6873017d80659942b8f6aa1a2f25f439ba8fba461fe22acbf701c2da7a786104a2e4852a70a89cdc0452d3'
    'e4c29f916cbee7c786262f17a475d2f645a88ef7709689df53c5e16d7ec6fe8ccbd1f9f246ef03a5f3412fa387f9db5025e1cfb7fa4bfd392a23525e28689bda'
)

pkgver() {
    cd "$srcdir/librime-lua"
    printf "1.5.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -r librime-lua $_pkgname-$_pkgver/plugins/lua
    cd $_pkgname-$_pkgver
    patch -p1 -i ../$_pkgname-opencc-1.1.patch
}

build() {
  cd $_pkgname-$_pkgver
  cmake . -Bbuild \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_MERGED_PLUGINS=OFF
#	-DBUILD_SEPARATE_LIBS=ON
#	-DBUILD_MERGED_PLUGINS=ON
  cmake --build build
}

package() {
  cd $_pkgname-$_pkgver/build/lib
  install -Dm755 librime-lua.so "$pkgdir"/usr/lib/librime-lua.so
  #make DESTDIR="$pkgdir" install
}

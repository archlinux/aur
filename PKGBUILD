# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=librime-lua-git
_pkgname=librime
pkgver=1.5.3.r74.f215a04
_pkgver=1.5.3
pkgrel=1
pkgdesc="Rime input method engine with Lua plugin"
arch=('x86_64')
url="https://github.com/hchunhui/librime-lua"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'google-glog' 'marisa' 'lua')
makedepends=('git' 'cmake' 'boost' 'gtest')
provides=('librime')
conflicts=('librime' 'librime-lua')
source=("librime-lua::git+https://github.com/hchunhui/librime-lua.git"
        "$_pkgname-$_pkgver.tar.gz::https://github.com/rime/librime/archive/$_pkgver.tar.gz"
)
sha512sums=('SKIP'
    '4d7f6ec43bd5728f59f0b3581bcd8a46128651430b6873017d80659942b8f6aa1a2f25f439ba8fba461fe22acbf701c2da7a786104a2e4852a70a89cdc0452d3'
)

pkgver() {
    cd "$srcdir/librime-lua"
    printf "%s.r%s.%s" "$(echo $_pkgver)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -r librime-lua $_pkgname-$_pkgver/plugins/lua
}

build() {
  cd $_pkgname-$_pkgver
  #cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
  #cmake --build build
  cmake . -Bbuild \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_MERGED_PLUGINS=ON
  cmake --build build
}

package() {
  cd $_pkgname-$_pkgver/build
  make DESTDIR="$pkgdir" install
}

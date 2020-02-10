# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=zerobrane-studio
_pkgname=ZeroBraneStudio
pkgver=1.80
pkgrel=4
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=(any)
url='https://studio.zerobrane.com/'
license=('MIT')
depends=('wxlua-git' 'lua-socket' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('zerobrane-studio')
conflicts=('zerobrane-studio-git')
optdepends=('love: to debug love programs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulchenko/$_pkgname/archive/$pkgver.tar.gz"
        "zbstudio.patch"
        "getbitmap.patch"
        "user.lua")
sha256sums=('4bc9d122cabf65e74c8ec427d4f265e5f5e772b3594fea8a8f691e7f4219cfd3'
            '73ca0f1a9d99882a821cacfc354d0bf85e7814f352c4a53c506dc44b048485c7'
            'b256bce3df66aea997b6ae01d43fccb9f771265fb851bf7298f4d384317719a2'
            '475fe6e129f9469100a941fc74b90a9fe4bc5eceaca447d2899a1511212cbfcc')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/zbstudio.patch"
  patch -p1 < "$srcdir/getbitmap.patch"
}

build() {
  cd "$_pkgname-$pkgver/build"
  sed -e '/check_lua_module(wx TRUE)/ s/^#*/#/' -i CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make -j4
}

package() {
  cd "$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/user.lua" "$pkgdir/usr/share/zbstudio/cfg/user.lua"
  cp "../lualibs/lua_parser_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
  cp "../lualibs/lua_lexer_loose.lua" "$pkgdir/usr/share/zbstudio/lualibs/"
}

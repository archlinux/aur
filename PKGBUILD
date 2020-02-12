# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=zerobrane-studio
_pkgname=ZeroBraneStudio
pkgver=1.90
pkgrel=3
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=('any')
url='https://studio.zerobrane.com/'
license=('MIT')
depends=('lua' 'wxlua' 'lua-socket' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('love: to debug love programs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulchenko/$_pkgname/archive/$pkgver.tar.gz"
        "zbstudio.patch"
        "user.lua")
sha256sums=('62307538cb1daa8c298c838f124f7cfff13c29e4c64c4ffea72191a6f1347ff2'
            '44f3a18f169a571bace71c67c398917ea0ff1c163c7d22bec49aed7585bcb9b2'
            '475fe6e129f9469100a941fc74b90a9fe4bc5eceaca447d2899a1511212cbfcc')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
  cd "$_pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$_pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/user.lua" -t "$pkgdir/usr/share/zbstudio/cfg"
  pushd ..
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 lualibs/lua_{parser,lexer}_loose.lua -t "$pkgdir/usr/share/zbstudio/lualibs"
}

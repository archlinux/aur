# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=zerobrane-studio
_pkgname=ZeroBraneStudio
pkgver=1.90
pkgrel=4
pkgdesc="A lightweight Lua-based IDE for Lua"
arch=('any')
url='https://studio.zerobrane.com/'
license=('MIT')
_lua_deps=('copas'
           'filesystem'
           'lpeg'
           'sec'
           'socket')
depends=('hicolor-icon-theme'
        'lua'
         "${_lua_deps[@]/#/lua-}"
        'wxlua')
makedepends=('cmake')
optdepends=('busted: to debug busted test specs'
            'gsl-shell: te debug GNU Scientific Library shell programs'
            'love: to debug löve programs'
            'lua51: to debug lua51 programs'
            'lua52: to debug lua52 programs')
backups=("etc/$pkgname/user.lua")
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulchenko/$_pkgname/archive/$pkgver.tar.gz"
        'zbstudio.patch'
        'user.lua')
sha256sums=('62307538cb1daa8c298c838f124f7cfff13c29e4c64c4ffea72191a6f1347ff2'
            '44f3a18f169a571bace71c67c398917ea0ff1c163c7d22bec49aed7585bcb9b2'
            '475fe6e129f9469100a941fc74b90a9fe4bc5eceaca447d2899a1511212cbfcc')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    cmake -S build -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd "$_pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 -t "$pkgdir/etc/$pkgname/" "$srcdir/user.lua"
    install -dm644 "$pkgdir/usr/share/zbstudio/cfg"
    ln -sf "/etc/$pkgname/user.lua" "$pkgdir/usr/share/zbstudio/cfg"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    cp -a lualibs "$pkgdir/usr/share/zbstudio/"
    # drop Lua deps we have the system providing
    pushd "$pkgdir/usr/share/zbstudio/"
    rm -rf lualibs/{ltn12,mime,re,socket,ssl}.lua lualibs/{copas,coxpcall,socket,ssl}
}

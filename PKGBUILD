# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=zerobrane-studio-git
_pkgname=ZeroBraneStudio
pkgver=1.90.r17.ge7bf45d
pkgrel=1
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
        'wxlua-git')
makedepends=('cmake')
optdepends=('lua-busted: to debug busted test specs'
            'gsl-shell: te debug GNU Scientific Library shell programs'
            'love: to debug löve programs'
            'lua51: to debug lua51 programs'
            'lua52: to debug lua52 programs'
            'lua53: to debug lua53 programs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backups=("etc/${pkgname%-git}/user.lua")
source=("git+https://github.com/pkulchenko/$_pkgname.git"
        'zbstudio.patch'
        'user.lua')
sha256sums=('SKIP'
            '44f3a18f169a571bace71c67c398917ea0ff1c163c7d22bec49aed7585bcb9b2'
            '812ec8aaa691b91f0054d97e1004475b6d2d4ef7b0b846615a8e3c3e4dd119c3')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    patch -p1 < "$srcdir/zbstudio.patch"
}

build() {
    cd "$_pkgname"
    cmake -S build -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd "$_pkgname"
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

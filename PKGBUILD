# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

_pkgname=ZeroBraneStudio
pkgname=zerobrane-studio
pkgver=2.01
pkgrel=1
pkgdesc='A lightweight Lua-based IDE for Lua'
arch=(any)
url='https://studio.zerobrane.com/'
license=(MIT)
_luadeps=(copas
           filesystem
           lpeg
           sec
           socket)
depends=('hicolor-icon-theme'
        'lua'
         "${_luadeps[@]/#/lua-}"
        wxlua)
makedepends=(cmake)
optdepends=('lua-busted: to debug busted test specs'
            'gsl-shell: te debug GNU Scientific Library shell programs'
            'love: to debug löve programs'
            'lua51: to debug lua51 programs'
            'lua52: to debug lua52 programs')
backups=("etc/$pkgname/user.lua")
_archive="$_pkgname-$pkgver"
source=("https://github.com/pkulchenko/$_pkgname/archive/$pkgver/$_archive.tar.gz"
        zbstudio.patch
        user.lua)
sha256sums=('2570b3fec51414572fde6cfd4c633b904f00d5eb387b7bc3296ffb07730d4e28'
            '44f3a18f169a571bace71c67c398917ea0ff1c163c7d22bec49aed7585bcb9b2'
            '46c752eb6fc3493d7c4123f543379b29dc25a7a0b6d56d155867d6aff6908b59')

prepare() {
    cd "$_archive"
    patch -p1 -i ../zbstudio.patch
}

build() {
    cd "$_archive"
    cmake -S build -B build \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=Release
    make -C build
}

package() {
    cd "$_archive"
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

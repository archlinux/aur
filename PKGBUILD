# Maintener: Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Michael Gerhaeuser <michael.gerhaeuser@gmail.com>
# Contributor: Harley Laue <losinggeneration@gmail.com>

_pkgname=ZeroBraneStudio
pkgname=zerobrane-studio-git
pkgver=2.01.r5.g803d382
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
depends=(hicolor-icon-theme
         lua
         "${_luadeps[@]/#/lua-}"
         wxlua-git)
makedepends=(cmake
             git)
optdepends=('lua-busted: to debug busted test specs'
            'gsl-shell: te debug GNU Scientific Library shell programs'
            'love: to debug löve programs'
            'lua51: to debug lua51 programs'
            'lua52: to debug lua52 programs'
            'lua53: to debug lua53 programs')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/user.lua")
source=("git+https://github.com/pkulchenko/$_pkgname.git"
        zbstudio.patch
        user.lua)
sha256sums=('SKIP'
            '44f3a18f169a571bace71c67c398917ea0ff1c163c7d22bec49aed7585bcb9b2'
            '812ec8aaa691b91f0054d97e1004475b6d2d4ef7b0b846615a8e3c3e4dd119c3')

prepare() {
	cd "$_pkgname"
	patch -p1 -i ../zbstudio.patch
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cmake -S build -B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	cd "$_pkgname"
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir/etc/${pkgname%-git}/" "$srcdir/user.lua"
	install -dm644 "$pkgdir/usr/share/zbstudio/cfg"
	ln -sf "/etc/${pkgname%-git}/user.lua" "$pkgdir/usr/share/zbstudio/cfg"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	cp -a lualibs "$pkgdir/usr/share/zbstudio/"
	# drop Lua deps we have the system providing
	pushd "$pkgdir/usr/share/zbstudio/"
	rm -rf lualibs/{ltn12,mime,re,socket,ssl}.lua lualibs/{copas,coxpcall,socket,ssl}
}

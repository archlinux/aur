# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=haxima-git
_pkgname=haxima
pkgver=r1.0cc63e9
pkgrel=1
pkgdesc='Haxima is an Ultima-like game engine (2D tile graphics) with combat, magic, NPC AI, an embedded scripting language, and in-game editing.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nazghul/'
license=('gpl3')
depends=('sdl_image'
         'sdl_mixer')
makedepends=('git'
             'sdl'
             'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}::git+https://git.code.sf.net/p/nazghul/git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	./autogen.sh --prefix=/usr
	make
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"

	DESTDIR="$pkgdir" make install

	# Other assets missed by `make install`
	local assets=(ai effects maps places sounds townsfolk)
	for asset in "${assets[@]}"; do
		cp -r "worlds/haxima-1.002/$asset" "$pkgdir/usr/share/nazghul/haxima/"
	done

	# Fix script/executable extension
	mv "$pkgdir/usr/bin/haxima.sh" "$pkgdir/usr/bin/haxima"

	# Desktop application launcher
	install -D haxima.desktop   "$pkgdir/usr/share/applications/haxima.desktop"
	install -D icons/haxima.png "$pkgdir/usr/share/pixmaps/haxima.png"
}

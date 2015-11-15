# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

pkgname=cataclysm-dda-git
pkgver=0.C.r7422.ge98a0e1
pkgrel=2
pkgdesc="Cataclysm: Dark Days Ahead is an actively maintained roguelike set in a post-apocalyptic world. Both SDL tiles and ascii version included."
arch=('i686' 'x86_64')
url="http://en.cataclysmdda.com/"
license=('CCPL:by-sa')
conflicts=('cataclysm-dda', 'cataclysm-dda-ncurses')
depends=('ncurses' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'freetype2' 'zlib')
makedepends=('git' 'gettext')
optdepends=('lua51')
install=
source=("$pkgname"::'git://github.com/CleverRaven/Cataclysm-DDA.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long | sed 's/-/.r/; s/-/./'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	sed -i 's/-Werror//' Makefile

}
build() {
       #LUA=1 is deactivated for now. Got bug while trying to build.

        cd "${srcdir}/${pkgname}"
	
        msg 'Building ncurses version...'
	make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 

	msg 'Building SDL version...'
	make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 TILES=1 SOUND=1
}

package() {
	cd "${srcdir}/${pkgname}"

	PREFIX="$pkgdir/usr" make install TILES=1 SOUND=1

	# Desktop file
	#install -dm755 "$pkgdir/usr/share/applications"
	#cp "$srcdir/cataclysm-dda.desktop" "$pkgdir/usr/share/applications"

	# Icon
	install -D 'data/osx/AppIcon.iconset/icon_128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/cataclysm-dda.png"

	# Docs
	install -d "$pkgdir/usr/share/doc/cataclysm-dda"
	cp -r doc/* "$pkgdir/usr/share/doc/cataclysm-dda"
	rm "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"
	cp 'data/json/LOADING_ORDER.md' "$pkgdir/usr/share/doc/cataclysm-dda/JSON_LOADING_ORDER.md"

	# License file
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}


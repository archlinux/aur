# Maintainer: TingPing <tingping@tingping.se>
# Contributor: Samir Benmendil <ram-z[at]chakra-project[dot]org>
# Contributor: aur2ccr (http://ddg.gg/?q=!ccr+aur2ccr&t=chakra)
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Klemen Košir <klemen913@gmail.com>

_gitname=Cataclysm-DDA
pkgname=cataclysm-dda-sdl-git
pkgver=0.C.r6906.ga75a558
pkgrel=1
pkgdesc='Cataclysm: Dark Days Ahead is a roguelike set in a post-apocalyptic world'
arch=('i686' 'x86_64')
url='http://en.cataclysmdda.com'
license=('CCPL:by-sa')
provides=('cataclysm-dda')
conflicts=('cataclysm-dda' 'cataclysm-dda-ncurses' 'cataclysm-dda-git')
depends=('sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'luajit' 'hicolor-icon-theme')
makedepends=('git')
install=cataclysm-dda.install
source=('git+https://github.com/CleverRaven/Cataclysm-DDA.git'
        'cataclysm-dda.desktop')
sha256sums=('SKIP'
            'a6e7044c9db5762d836bebe1651f30027fbcb23124d9ad2e85a3b8bb6d78606e')

pkgver() {
	cd "$_gitname"

	git describe --tags --long | sed 's/-/.r/; s/-/./'
}

prepare() {
	cd "$_gitname"

	#sed -i 's/ncursesw5/ncursesw6/g' Makefile
	sed -i 's/-Werror//' Makefile

	# Use luajit
	sed -i 's/LUA_BINARY = lua$/LUA_BINARY = luajit/' Makefile
	sed -i 's/LUA_CANDIDATES = .*/LUA_CANDIDATES = luajit/' Makefile
}
 
build() {
	cd "$_gitname"

	#msg 'Building ncurses version...'
	#make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 LUA=1

	msg 'Building SDL version...'
	make PREFIX=/usr RELEASE=1 USE_XDG_DIR=1 TILES=1 SOUND=1 LUA=1
}
 
package() {
	cd "$_gitname"

	PREFIX="$pkgdir/usr" make install TILES=1 SOUND=1 LUA=1

	# Desktop file
	install -dm755 "$pkgdir/usr/share/applications"
	cp "$srcdir/cataclysm-dda.desktop" "$pkgdir/usr/share/applications"

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

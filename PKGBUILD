# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
_srcname=X-Crawl
pkgname=xcrawl-tiles
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="Dungeon Crawl Stone Soup Fork developed through a democratic process with graphical tiles and sound support"
arch=('i686' 'x86_64')
url="https://github.com/Vajrapani/X-Crawl"
license=('GPL')
depends=(
	'sdl2_image'
	'sdl2_mixer'
	'freetype2'
	'lua51'
	'sqlite'
	'glu'
)
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
backup=()
options=()
source=("https://github.com/Vajrapani/X-Crawl/archive/v$pkgver.tar.gz")
md5sums=('5134db88ec4ac96a6495304224ff5c26')

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "X-Crawl tiles" --categories "Application;Game" --exec "xcrawl"

	cd "$_srcname-$pkgver/crawl-ref/source"
	
	sed -i 's/GAME = crawl/GAME = xcrawl/' Makefile
	echo $pkgver > util/release_ver
}

build() {
	cd "$_srcname-$pkgver/crawl-ref/source"

	make \
		prefix=/usr \
		bin_prefix=bin \
		DATADIR=share/xcrawl \
		DESTDIR=$pkgdir \
		SAVEDIR='~/.xcrawl' \
		LUA_PACKAGE=lua51 \
		TILES=y \
		SOUND=y
}

# Tests cannot be run without a debug build.
# To enable them, add the debug target to build()
#check() {
#	cd "$_srcname-$pkgver/crawl-ref/source"
#	make -k test \
#		prefix=/usr \
#		bin_prefix=bin \
#		DATADIR=share/xcrawl \
#		DESTDIR=$pkgdir \
#		SAVEDIR='~/.crawl' \
#		LUA_PACKAGE=lua51 \
#		TILES=y
#}

package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$_srcname-$pkgver/crawl-ref/source"

	make install \
		prefix=/usr \
		bin_prefix=bin \
		DATADIR=share/xcrawl \
		DESTDIR=$pkgdir \
		SAVEDIR='~/.xcrawl' \
		LUA_PACKAGE=lua51 \
		TILES=y \
		SOUND=y

	install -Dm644 "dat/tiles/stone_soup_icon-32x32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

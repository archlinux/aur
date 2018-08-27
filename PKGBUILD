# Maintainer: Sean Anderson <seanga2@gmail.com>
# Contributor: Taran Lynn <taranlynn0@gmail.com>
_srcname=crawl
pkgname=crawl-tiles
pkgver=0.22.0
pkgrel=2
epoch=
pkgdesc="Dungeon Crawl Stone Soup with graphical tiles and sound support"
arch=('i686' 'x86_64')
url="https://crawl.develz.org/"
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
provides=('crawl')
conflicts=('crawl')
backup=()
options=()
source=("https://github.com/crawl/$_srcname/archive/$pkgver.tar.gz")
md5sums=('097b897d53f42f0ed2aff13ff1746738')

getCRAWLOPT() {
	CRAWLOPT="
	prefix=/usr
	bin_prefix=bin
	DESTDIR=$pkgdir
	SAVEDIR='~/.crawl'
	LUA_PACKAGE=lua51
	TILES=y
	SOUND=y"
}

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Crawl tiles" --categories "Application;Game" --exec "crawl"

	cd "$_srcname-$pkgver/crawl-ref/source"

	echo $pkgver > util/release_ver
}

build() {
	cd "$_srcname-$pkgver/crawl-ref/source"

	getCRAWLOPT
	make $CRAWLOPT
}

# Tests cannot be run without a debug build.
# To enable them, add the debug target to build()
#check() {
#	cd "$_srcname-$pkgver/crawl-ref/source"
#	make -k test $CRAWLOPT
#}

package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$_srcname-$pkgver/crawl-ref/source"

	getCRAWLOPT
	make install $CRAWLOPT
	# Crawl now creates the save directory in /usr for some reason...
	rm -rf $pkgdir/usr/\~/
	install -Dm644 "dat/tiles/stone_soup_icon-32x32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

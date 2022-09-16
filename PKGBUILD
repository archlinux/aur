# Maintainer: René Wagner <rwagner@rw-net.de>
# Contributor: Sean Anderson <seanga2@gmail.com>
# Contributor: Taran Lynn <taranlynn0@gmail.com>
# Contributor: Derek Hawker <derekhawker+aur@gmail.com>
_srcname=crawl
pkgname=crawl-tiles
pkgver=0.29.1
pkgrel=1
pkgdesc="Dungeon Crawl Stone Soup with graphical tiles and sound support"
arch=('i686' 'x86_64' 'aarch64')
url="https://crawl.develz.org/"
license=('GPL')
depends=(
	'sdl2_image'
	'sdl2_mixer'
	'freetype2'
	'lua51'
	'sqlite'
	'zlib'
	'python-pyaml'
	'glu'
	'ttf-dejavu'
)
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=('crawl' 'stone-soup')
conflicts=('crawl' 'stone-soup')
backup=()
options=()
source=("https://github.com/crawl/$_srcname/archive/$pkgver.tar.gz")
sha256sums=('e8ff1d09718ab3cbff6bac31651185b584c9eea2c9b6f42f0796127ca5599997')

getCRAWLOPT() {
	CRAWLOPT=(
		prefix=/usr
		bin_prefix=bin
		DESTDIR=$pkgdir
		SAVEDIR='~/.crawl'
		LUA_PACKAGE=lua51
		TILES=y
		SOUND=y
	)
}

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Crawl tiles" --categories "Application;Game" --exec "crawl"

	cd "$_srcname-$pkgver/crawl-ref/source"

	echo $pkgver > util/release_ver
}

build() {
	cd "$_srcname-$pkgver/crawl-ref/source"

	getCRAWLOPT
	NPROC=$(getconf _NPROCESSORS_ONLN)
    
	make -j${NPROC} "${CRAWLOPT[@]}"
}

package() {
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$_srcname-$pkgver/crawl-ref/source"

	getCRAWLOPT
	make install "${CRAWLOPT[@]}"
	# Crawl now creates the save directory in /usr for some reason...
	rm -rf $pkgdir/usr/\~/
	install -Dm644 "dat/tiles/stone_soup_icon-32x32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

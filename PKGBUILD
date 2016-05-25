# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v3.7.5
pkgrel=1
pkgdesc="A Circuit simulation tool written by plexim (license needed, only demo mode available otherwise)"
url='http://www.plexim.com/de/products/plecs_standalone'

arch=('x86_64' 'i686')
license=('custom')
provides=('plecs-standalone')
depends=('qt4' 'ncurses5-compat-libs')
makedepends=('findutils')

source=("plecs.desktop")
md5sums=('6a70b9891052f0a18e56565f81182a2d')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-3-7-5_linux64.tar.gz")
md5sums_x86_64=('3b4c9e61c7284e5431810c832fba1dd8')
sha1sums_x86_64=('0aa7448b450f38a1ab2f0471f4efe4652feabd7b')

source_i686=("$pkgname-$pkgver-i686.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-3-7-5_linux32.tar.gz")
md5sums_i686=('e8e13583c1b047b0eddad40f95a36aea')
sha1sums_i686=('289b407fa089f1d89c8b178b60fa6e5d6d6d799a')

package() {
	# desktop file
	mkdir -p "$pkgdir/usr/share/applications/"
	install -m 664 plecs.desktop "$pkgdir/usr/share/applications/"

	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/plecs/"
	mkdir -p "$pkgdir/usr/share/plecs/private"
	mkdir -p "$pkgdir/usr/share/licenses/plecs"

	install -m 664 license.txt 		"$pkgdir/usr/share/licenses/plecs/LICENSE"
	install -m 664 Components.plecs 	"$pkgdir/usr/share/plecs/"
	install -m 664 Deprecated.plecs 	"$pkgdir/usr/share/plecs/"
	install -m 775 PLECS.bin 		"$pkgdir/usr/share/plecs/plecs"
	install -m 775 crashreporter.bin 	"$pkgdir/usr/share/plecs/crashreporter"

	# private dir
	install -m 775 "private/plecs.oct" 	"$pkgdir/usr/share/plecs/private/"
	install -m 664 private/*.m 		"$pkgdir/usr/share/plecs/private/"

	# include dir	
	cp include "$pkgdir/usr/share/plecs/include" -r

	cp plugins "$pkgdir/usr/share/plecs/" -r
	find "$pkgdir/usr/share/plecs/plugins" -type f -exec chmod 775 {} +

	cp onlinehelp "$pkgdir/usr/share/plecs/" -r
	find "$pkgdir/usr/share/plecs/onlinehelp" -type f -exec chmod 664 {} +

	cp pilframeworks "$pkgdir/usr/share/plecs/" -r 
	find "$pkgdir/usr/share/plecs/pilframeworks" -type f -exec chmod 775 {} +

	
	cp octave 	"$pkgdir/usr/share/plecs/" -r
	cp demos 	"$pkgdir/usr/share/plecs/" -r 

	find "$pkgdir/usr/share/plecs/demos" -type f -exec chmod 664 {} +
	
	echo '#!/bin/sh' > plecs
	echo 'cd /usr/share/plecs/' >> plecs
	echo 'exec ./plecs' >> plecs
	
	install -m 775 -t "$pkgdir/usr/bin/" plecs 
}

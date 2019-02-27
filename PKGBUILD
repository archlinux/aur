# Maintainer: robertfoster
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=dhewm3
pkgver=1.5.0
pkgrel=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('curl' 'doom3-data' 'libjpeg' 'libvorbis' 'openal' 'sdl2')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz"
	"$pkgname.desktop"
	"$pkgname.png"
'0001-game_data_location.patch')

prepare() {
	cd "$pkgname-$pkgver"

	for patch in ../*.patch; do
		if [ ! -f "$patch" ]; then
			break;
		else
			patch -p1 -i "$patch"
		fi
	done
}

build() {
	cd "$pkgname-$pkgver/neo"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DD3XP=1 -DDEDICATED=1 .
	make
}

package() {
	cd "$pkgname-$pkgver/neo"

	make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
	install -Dm644 ../../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 ../../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

md5sums=('cc770a4e454704405a83d8ea170706e8'
	'300636e2e3ac0566dc6ceb63f121850e'
	'8b834c4c1cd5ccb25b1afe6cb47941a8'
'27ac81efff2c25cd672979ea931c2cce')

# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-hclient
pkgver=3.2
pkgrel=1
pkgdesc="A customized client by CytraL for this 2D shooting game"
arch=('i686' 'x86_64')
url="https://www.teeworlds.com/forum/viewtopic.php?id=9011"
     # and  http://hclient.wordpress.com/
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('python' 'bam' 'mesa' 'gendesk' 'imagemagick')
provides=('teeworlds')
conflicts=('teeworlds')
_hash=0956db684ee61fcd3ff6e4861ebaa42c03d4bc12
source=("HClient-$pkgver.zip::https://github.com/CytraL/HClient/archive/$_hash.zip")
md5sums=('e7f237b51d24aa5f05d1311a430a3548')

prepare() {
  convert "HClient-$_hash/other/icons/Teeworlds.ico" "$srcdir/$pkgname.png"
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
}

build() {
	# Build teeworlds
	cd HClient-$_hash
	bam client_release server_release
}

package() {
	cd HClient-$_hash

	# Install data files
	mkdir -p "$pkgdir"/usr/share/teeworlds/data
	cp -r data/* "$pkgdir"/usr/share/teeworlds/data

	install -Dm755 teeworlds "$pkgdir"/usr/bin/teeworlds-hclient
	install -Dm755 teeworlds_srv "$pkgdir"/usr/bin/teeworlds-hclient_srv

	install -Dm644 "$srcdir"/$pkgname.desktop \
		"$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm644 "$srcdir"/$pkgname-0.png \
		"$pkgdir"/usr/share/pixmaps/$pkgname.png

	install -Dm644 license.txt \
		"$pkgdir"/usr/share/licenses/$pkgname/license.txt
	install -Dm644 readme.txt \
		"$pkgdir"/usr/share/licenses/$pkgname/readme.txt
}

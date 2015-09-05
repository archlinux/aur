# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-hclient
pkgver=4.0
pkgrel=1
pkgdesc="A customized client by CytraL for this 2D shooting game"
arch=('i686' 'x86_64')
url="https://hclient.wordpress.com/"
     # and https://www.teeworlds.com/forum/viewtopic.php?id=9011
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('python' 'bam' 'mesa' 'gendesk' 'imagemagick')
provides=('teeworlds')
conflicts=('teeworlds')
source=("HClient-$pkgver.zip::https://github.com/CytraL/HClient/archive/v$pkgver.tar.gz")
md5sums=('ebb1bb0a1a269d637457df0473f10848')

prepare() {
  convert "HClient-$pkgver/other/icons/Teeworlds.ico" "$srcdir/$pkgname.png"
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
}

build() {
	# Build teeworlds
	cd HClient-$pkgver
	bam client_release server_release
}

package() {
	cd HClient-$pkgver

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
	install -Dm644 readme.md \
		"$pkgdir"/usr/share/doc/$pkgname/readme.md
}

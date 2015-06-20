# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-sushitee
pkgver=0.6.2
pkgrel=2
pkgdesc="A customized client by SushiTee of this 2D shooting game"
arch=('i686' 'x86_64')
url="https://www.teeworlds.com"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('unzip' 'python' 'bam' 'mesa' 'imagemagick' 'gendesk')
provides=('teeworlds')
conflicts=('teeworlds')
source=(https://github.com/SushiTee/teeworlds/archive/Client-Pack-0.6.tar.gz
        https://github.com/SushiTee/teeworlds-translation/archive/master.zip)
md5sums=('f328e401de98bb0f2a9d7ded1a0398bd'
         'b7d7c0be0667c34ebb94b1663db7f5ac')

prepare() {
  convert "teeworlds-Client-Pack-0.6/other/icons/Teeworlds.ico" "$srcdir/teeworlds.png"
  gendesk -f -n --pkgname "teeworlds" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
}

build() {
	# Build teeworlds
	cd teeworlds-Client-Pack-0.6
	bam server_release client_release
}

package() {
	cd teeworlds-Client-Pack-0.6

	# Install data files
	mkdir -p "${pkgdir}"/usr/share/teeworlds/data
	cp -r data/* "${pkgdir}"/usr/share/teeworlds/data
	mv ../teeworlds-translation-master/data/languages "${pkgdir}"/usr/share/teeworlds/data

	install -Dm755 teeworlds "${pkgdir}"/usr/bin/teeworlds
	install -Dm755 teeworlds_srv "${pkgdir}"/usr/bin/teeworlds_srv

	install -Dm644 "${srcdir}"/teeworlds.desktop \
		"${pkgdir}"/usr/share/applications/teeworlds.desktop
	install -Dm644 "${srcdir}"/teeworlds-0.png \
		"${pkgdir}"/usr/share/pixmaps/teeworlds.png

	install -Dm644 license.txt \
		"${pkgdir}"/usr/share/licenses/teeworlds/license.txt
}

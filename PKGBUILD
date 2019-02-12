# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=2.1.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"
source=(https://github.com/iNavFlight/inav-configurator/archive/2.1.2.zip
        inav-configurator.desktop)
md5sums=('3e6f47c82471ef6ca977b4f03ebe1f30'
         'SKIP')
provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL3')
makedepends=('yarn')

build() {
	cd $pkgname-$pkgver
	yarn install

	if [[ "$CARCH" == "i686" ]]; then
		./node_modules/.bin/gulp --platform=linux32 release
	elif [[ "$CARCH" == "x86_64" ]]; then
	   ./node_modules/.bin/gulp --platform=linux64 release
	fi
}

package() {
	cd $pkgname-$pkgver/apps/inav-configurator/linux64/
	install -d "$pkgdir/opt/inav/inav-configurator/"
	cp -r * "$pkgdir/opt/inav/inav-configurator/"

	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/images/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/inav/inav-configurator/inav-configurator "$pkgdir/usr/bin/inav-configurator"
}
# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=3.0.2
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"
source=(https://github.com/iNavFlight/inav-configurator/archive/3.0.2.zip
        inav-configurator.desktop)
sha256sums=('b8e8ded81b3dd8ea17b785069e7bd985636f330bab7dca16b2c869e6f9a918e5'
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
	if [[ "$CARCH" == "i686" ]]; then
		cd $pkgname-$pkgver/apps/inav-configurator/linux32/
	elif [[ "$CARCH" == "x86_64" ]]; then
		cd $pkgname-$pkgver/apps/inav-configurator/linux64/
	fi
	
	install -d "$pkgdir/opt/inav/inav-configurator/"
	cp -r * "$pkgdir/opt/inav/inav-configurator/"

	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/images/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"

	install -d "$pkgdir/usr/bin/"
	ln -s "$pkgdir/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"

	echo "Dont forget to add your user into uucp group \"sudo usermod -aG uucp $USER\" for serial access"
}
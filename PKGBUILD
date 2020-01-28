# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=satoshipay-stellar-wallet
_pkgname="Solar Wallet"
pkgver=0.23.0
pkgrel=1
pkgdesc="Wallet for the Stellar payment network by SatoshiPay."
arch=('any')
url="https://solarwallet.io"
license=('GPL3')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/satoshipay/solar/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('f949e34dda2fbb8aa106c50d304a71cf224450d588f87c06c5d78c2a7bfb0ab7'
            '324be6ef538277807cde3cae08fd3a5266193c722832db18a7a51f04c4d7b58a')

build() {
	cd "solar-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run build:linux
}

package() {
	cd "solar-$pkgver"

	# Install directories
	install -dm755 \
		"$pkgdir/"{opt/"$_pkgname",usr/bin}

	# Remove files for other platforms
	rm -rf electron/dist/linux-unpacked/resources/app.asar.unpacked/node_modules/sodium-native/prebuilds/{darwin*,win32*}

	# Copy main files
	cp -a electron/dist/linux-unpacked/* "$pkgdir/opt/$_pkgname"

	# Link to the binary
	ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Install icon
	install -Dm644 electron/build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Install desktop file
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

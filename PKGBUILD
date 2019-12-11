# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=satoshipay-stellar-wallet
_pkgname="Solar Wallet"
pkgver=0.22.1
pkgrel=2
pkgdesc="Wallet for the Stellar payment network by SatoshiPay."
arch=('x86_64')
url="https://solarwallet.io"
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-atk'
         'libappindicator-gtk3' 'libsecret')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/satoshipay/solar/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('434547c1da6756c99baa8afb48417a22a595736a8841a1d16ab399680c1fe47c'
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

	# Remove files for other architectures & copy main files
	rm -rf electron/dist/linux-unpacked/resources/app.asar.unpacked/node_modules/sodium-native/prebuilds/{darwin*,linux-arm,win32*}
	cp -a electron/dist/linux-unpacked/* "$pkgdir/opt/$_pkgname"

	# Link to the binary
	ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Install icon
	install -Dm644 electron/build/icon.png \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

	# Install desktop file
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=satoshipay-stellar-wallet
_pkgname="Solar Wallet"
pkgver=0.24.0
pkgrel=2
pkgdesc="Wallet for the Stellar payment network by SatoshiPay."
arch=('any')
url="https://solarwallet.io"
license=('GPL3')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
makedepends=('npm')
provides=('solarwallet')
conflicts=('solarwallet')
source=("$pkgname-$pkgver.tar.gz::https://github.com/satoshipay/solar/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('e3c5110d945d465847fc7953bd3f822f9f8ae8092898fa8a214f073a2a4a738b'
            '61f4836da7c5b158daee5bdcc743786fab7ab94ae4f7a3dd2873276f7eee7760')

build() {
	cd "solar-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run build:linux
}

package() {
	cd "solar-$pkgver"

	# Install directories
	install -dm755 "$pkgdir/"{opt/"$_pkgname",usr/bin}

	# Remove files for other platforms
	rm -rf electron/dist/linux-unpacked/resources/app.asar.unpacked/node_modules/sodium-native/prebuilds/{darwin*,win32*}

	# Copy main files
	cp -a electron/dist/linux-unpacked/* "$pkgdir/opt/$_pkgname"

	# Link to the binary
	ln -sf "/opt/$_pkgname/io.solarwallet.app" "$pkgdir/usr/bin/$pkgname"

	# Install icon
	install -Dm644 electron/build/icons/512.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Install desktop file
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

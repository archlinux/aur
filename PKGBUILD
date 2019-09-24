# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.7
pkgrel=3
pkgdesc="An open source, fully transparent and extremely secure password manager"
arch=('any')
url="https://qvault.io"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'npm')
source=("${pkgname}-${pkgver}::https://github.com/Q-Vault/qvault/archive/v${pkgver}.tar.gz"
	'qvault.desktop'
	'qvault'
	'electron.patch'
	)
sha256sums=('6a9ebe5a83a6890df62bbd3375ccb357d245072b6cf0ffb36d29337032521ec7'
	'SKIP'
	'SKIP'
	'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i ../electron.patch
	sed -i 's/mainWindow.webContents.openDevTools()/\/\/ &/' main.js
	yarn install
}

build() {
	cd "$pkgname-$pkgver"
	yarn release -l dir -c.electronVersion
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{applications,licenses}}
	cd "$pkgname-$pkgver"

	mv build/{icon,qvault}.png
	mv release/linux-unpacked/resources/{app,qvault}.asar

	install -m755 "$srcdir/qvault" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 "$srcdir/$pkgname-$pkgver/build/qvault.png" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/qvault.desktop" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname-$pkgver/release/linux-unpacked/resources/qvault.asar" "$pkgdir/usr/share/"
}

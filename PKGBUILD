# Maintainer: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=qvault
pkgver=0.2.8
pkgrel=1
pkgdesc="An open source, fully transparent and extremely secure password manager"
arch=('any')
url="https://qvault.io"
license=('MIT')
depends=('electron')
makedepends=('yarn' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Q-Vault/qvault/archive/v${pkgver}.tar.gz"
	'qvault.desktop'
	'qvault'
	'electron.patch'
	)
sha256sums=('4d90ae6f0a576f576d576a5d93377941185007f0eff748baa7344e1c14023276'
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
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/licenses"
	cd "$pkgname-$pkgver"

	mv build/{icon,qvault}.png
	mv release/linux-unpacked/resources/{app,qvault}.asar

	install -m755 "$srcdir/qvault" "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 "$srcdir/$pkgname-$pkgver/build/qvault.png" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/qvault.desktop" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname-$pkgver/release/linux-unpacked/resources/qvault.asar" "$pkgdir/usr/share/"
}

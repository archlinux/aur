# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gmail-desktop
pkgver=2.21.1
pkgrel=2
pkgdesc="Unofficial Gmail desktop app"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('electron')
makedepends=('yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('0245b6ae9c5df72e9c1ec25493e70410e2fc50e01e7fb339c2119ecf6be49dec'
            'a1f2eb9525dd10556ffde37a4dc9e06636a81d1d9ce815d1167e48954abee1dc'
            '8c30e207fe88455f63f4c0b2ae9087a2ca2bbeaa68b9be244c31a9ec392373c4')

prepare() {
	cd "$pkgname-$pkgver"

	# Disable building of other packages
	sed -i '101,105d' package.json
	sed -i 's/tar.bz2/dir/g' package.json
	sed -i 's/linux --windows/linux/g' package.json
}

build() {
	cd "$pkgname-$pkgver"
	yarn install --cache-folder "$srcdir/yarn-cache"
	yarn dist:others
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r --no-preserve=ownership dist/linux-unpacked/resources \
		"$pkgdir/usr/lib/$pkgname"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

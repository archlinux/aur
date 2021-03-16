# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gmail-desktop
pkgver=2.25.0
pkgrel=1
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
sha256sums=('d535a2445b94127966d759d28411474f1c074f9680fd66bcfecd1d1231c4f01f'
            'a1f2eb9525dd10556ffde37a4dc9e06636a81d1d9ce815d1167e48954abee1dc'
            '8c30e207fe88455f63f4c0b2ae9087a2ca2bbeaa68b9be244c31a9ec392373c4')

prepare() {
	cd "$pkgname-$pkgver"

	# Disable building dist packages
	sed -i '109,113d' package.json
	sed -i 's/tar.bz2/dir/g' package.json
}

build() {
	cd "$pkgname-$pkgver"
	yarn install --cache-folder "$srcdir/yarn-cache"
	yarn compile
	yarn build:linux
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

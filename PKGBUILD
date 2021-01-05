# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ytmdesktop
pkgver=1.13.0
pkgrel=3
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
depends=('electron10')
makedepends=('npm')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('c50172d473c43eafebd366587c690eec88961f2092d2c7b4dd2904df945ade46'
            '43658b3fd92526d37ce43b35afa8aabac7cf6f021a0ff7c416caa443f6fdf215'
            '3ed0c519e62483bb411e258df6d100463b8a417930ea67b34844bde8464e143d')

build() {
	cd "$pkgname-$pkgver"
	npm install --cache "$srcdir/npm-cache"
	npm run publish:lin
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname"

	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	for icon_size in 16 256 512; do
		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 src/assets/favicon.${icon_size}x${icon_size}.png \
			$pkgdir/$icons_dir/$pkgname.png
	done

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}

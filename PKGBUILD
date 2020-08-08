# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ytmdesktop
pkgver=1.12.1
pkgrel=1
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
depends=('electron')
makedepends=('npm')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmdesktop/ytmdesktop/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('cfe17ed78afbef56009f1b2bc4709e65d7aca3b21b58948e57b689dc752196bb'
            '4cbf5c9c7a2b24feb0fd623bf267cf8da1a9948431affba9b3927d5df84a269a'
            '3f937b477845f9b0391731a4e7b7cf3a52101c03f48eb34d29124b4664eb59a1')

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

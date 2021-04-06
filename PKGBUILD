# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=android-messages-desktop
pkgver=5.1.1
pkgrel=1
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=('electron11')
makedepends=('git' 'yarn')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('616a3174809e60356ca9204fdb7a9d319f705746ed67533da95ea682d974231d'
            '5d4a885c7a4cf6330df5b00b39f51da85af38c715ed72233286bd296f2bb2c57'
            '1bf16b8864712b0c1de72d8c3764db14b75ecf64dae44d206a26aa036ac53b1a')

build() {
	cd "$pkgname-$pkgver"
	yarn --cache-folder "$srcdir/yarn-cache"
	yarn build
	./node_modules/.bin/electron-builder --linux dir
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname"

	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	for icon_size in 16 24 32 48 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir$icons_dir
		install -m644 resources/icons/${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done
}

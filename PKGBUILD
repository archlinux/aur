# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: jswenson
pkgname=android-messages-desktop
pkgver=4.0.0
pkgrel=1
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
#url="https://github.com/chrisknepper/android-messages-desktop"
url="https://github.com/OrangeDrangon/android-messages-desktop"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk3')
makedepends=('git' 'yarn')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('d7e4313be62c5140e48c12c3f9093854b9d0f30ff4e0a2faed85e9e5a21b5a58'
            'ef967c944762e6032c78db578be46a89e5eac2bc8bee856e21d67a6029e1dc69'
            '1bf16b8864712b0c1de72d8c3764db14b75ecf64dae44d206a26aa036ac53b1a')

prepare() {
	cd "$pkgname-$pkgver"

	# Disable building of dist packages
	sed -i 's/"AppImage", "snap", "pacman", "deb", "rpm", "freebsd", "zip"/"dir"/g' \
		electron-builder.js
}

build() {
	cd "$pkgname-$pkgver"
	yarn --cache-folder "$srcdir/yarn-cache"
	yarn run dist
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

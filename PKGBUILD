# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=1.12.1.r15.gbdcea44
pkgrel=1
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
depends=('gtk3' 'nss' 'libxss')
makedepends=('git' 'npm' 'python')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ytmdesktop/ytmdesktop.git#branch=development'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '3f937b477845f9b0391731a4e7b7cf3a52101c03f48eb34d29124b4664eb59a1')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	npm install --cache "$srcdir/npm-cache"
	npm run publish:lin
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -dm755 "$pkgdir/opt/${pkgname%-git}"
	cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-git}"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-git}/youtube-music-desktop-app" \
		"$pkgdir/usr/bin/${pkgname%-git}"

	for icon_size in 16 256 512; do
		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 src/assets/favicon.${icon_size}x${icon_size}.png \
			$pkgdir/$icons_dir/${pkgname%-git}.png
	done

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
}

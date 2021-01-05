# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Simon Allen <simon@simonallen.org>
pkgname=ytmdesktop-git
pkgver=1.13.0.r83.gea2a1d2
pkgrel=1
pkgdesc="A desktop app for YouTube Music"
arch=('x86_64')
url="https://ytmdesktop.app"
license=('CC0 1.0 Universal')
depends=('electron10')
makedepends=('git' 'npm' 'python')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon'
            'nss-mdns: for companion server')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ytmdesktop/ytmdesktop.git#branch=development'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '3ed0c519e62483bb411e258df6d100463b8a417930ea67b34844bde8464e143d'
            '43658b3fd92526d37ce43b35afa8aabac7cf6f021a0ff7c416caa443f6fdf215')

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
	install -dm755 "$pkgdir/usr/lib/${pkgname%-git}"
	cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/${pkgname%-git}"

	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

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

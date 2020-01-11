# Maintainer: Simon Allen <simon@simonallen.org>

pkgname=ytmdesktop-git
pkgver=1.8.1
pkgrel=1
pkgdesc="A desktop app for YouTube Music"
arch=('i686' 'x86_64')
url="https://ytmdesktop.app"
depends=('gtk3' 'nss' 'libxss')
makedepends=('git' 'npm')
optdepends=('gnome-keyring' 'lsb-release' 'avahi' 'nss-mdns')
provides=('ytmdesktop')
conflicts=()
license=('CC0 1.0 Universal')

source=('git+https://github.com/ytmdesktop/ytmdesktop.git'
        'ytmdesktop.desktop')
md5sums=('SKIP'
         '1bd2f5256cabb91210e418b26f13b757')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	rm -rf node_modules
	npm install --cache "$srcdir/npm-cache"

	if [ $CARCH = "x86_64" ]; then
		env ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true npm run pack:x64
	elif [ $CARCH = "i686" ]; then
		env ELECTRON_BUILDER_ALLOW_UNRESOLVED_DEPENDENCIES=true npm run pack
	fi
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# install license
	install -D -m 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"

	# install icon
	install -D -m 644 assets/favicon.512x512.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

	# copy application files
	install -d -m 755 "$pkgdir/opt/${pkgname%-git}"
	cp -r dist/linux-unpacked/* "$pkgdir/opt/${pkgname%-git}"

	# link binary
	install -d -m 755 "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-git}/youtube-music-desktop-app" "$pkgdir/usr/bin/${pkgname%-git}"

	# install desktop entry
	install -D -m 644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ooniprobe-desktop
pkgver=3.5.2
_cliver=3.10.0-beta.3
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://ooni.org"
license=('MIT')
depends=('nss' 'libxss' 'libxtst' 'xdg-utils')
makedepends=('yarn')
conflicts=("${pkgname%-desktop}")
replaces=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-desktop/archive/v$pkgver.tar.gz"
        "${pkgname%-desktop}-cli-$_cliver.tar.gz::https://github.com/ooni/probe-cli/releases/download/v$_cliver/ooniprobe_linux_amd64.tar.gz"
        "${pkgname%-desktop}-cli-$_cliver.tar.gz.asc::https://github.com/ooni/probe-cli/releases/download/v$_cliver/ooniprobe_linux_amd64.tar.gz.asc"
        "$pkgname.desktop")
noextract=("${pkgname%-desktop}-cli-$_cliver.tar.gz")
sha256sums=('91e93cf34f853ab4658c5bb3972879af6879a1df3f9966f4510b256c685af122'
            'bcd72321de6b703f6103df9c5994040113d19cf1253d41f4d1dfc58a4ec44a67'
            'SKIP'
            'baaf4f3cca079dddc0b4e048c8778c6cc84786bb88fd9d218424b7b9f04f1135')
validpgpkeys=('738877AA6C829F26A431C5F480B691277733D95B') # Simone Basso <bassosimone@gmail.com>

prepare() {
	cd "${pkgname#ooni}-$pkgver"

	# Disable downloading probe-cli for other platforms
	sed -i "s/'darwin_amd64', 'linux_amd64', 'windows_amd64'/'linux_amd64'/g" \
		scripts/download-bin.js

	# Place files for verification
	mkdir -p build/probe-cli/linux_amd64
	cp "$srcdir/${pkgname%-desktop}-cli-$_cliver.tar.gz" \
		"build/probe-cli/${pkgname%-desktop}_linux_amd64.tar.gz"
	cp "$srcdir/${pkgname%-desktop}-cli-$_cliver.tar.gz.asc" \
		"build/probe-cli/${pkgname%-desktop}_linux_amd64.tar.gz.asc"
}

build() {
	cd "${pkgname#ooni}-$pkgver"
	yarn install --cache-folder "$srcdir/yarn-cache"
	yarn run build
	node_modules/.bin/electron-builder --linux
}

package() {
	cd "${pkgname#ooni}-$pkgver"
	install -d "$pkgdir/opt/OONI Probe"
	cp -a dist/linux-unpacked/* "$pkgdir/opt/OONI Probe"

	install -d "$pkgdir/usr/bin"
	ln -sf "/opt/OONI Probe/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 48; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/icon_${icon_size}x${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	for icon_size in 32 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 dist/.icon-set/app_${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done
}

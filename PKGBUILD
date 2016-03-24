# Maintainer: Jacob Mischka <jacob@mischka.me>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
pkgname=brave
pkgver=0.8.2
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('x86_64')
url='https://www.brave.com/'
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
makedepends=('npm')
install="$pkgname".install
source=("https://github.com/brave/browser-laptop/archive/v"$pkgver"dev.tar.gz"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
	'brave-browser.desktop')
sha384sums=('0ec654691c52548da663adb1c02f8a77e82de8c05d9168ce6ac875c994895d5419f114ec6e3a24b4b3e242eac73f091f'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            '06f719e5e09dcc40a8031f7aa1933c762eacfe47eaff4c8a26f70f201d814280a9b2dde8fd94e74b0c64ce69a08787ee')

build() {
	cd "$srcdir"/browser-laptop-"$pkgver"dev
	npm install node-gyp@3.2.1
	# I'm using cargo-culting in anger to beat this dead horse into a tin can...
	npm install graceful-fs
	npm install ampersand-state
	npm install lodash
	# But makes the build finish successfully. QED.
	npm install
	CHANNEL=dev npm run build-package
}

package() {
	cd "$srcdir"/browser-laptop-"$pkgver"dev

	install -dm0755 "$pkgdir"/opt
	cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/opt/brave

	install -Dm0644 "$srcdir"/brave-browser.desktop "$pkgdir"/usr/share/applications/brave-browser.desktop

	install -dm0755 "$pkgdir"/usr/bin
	ln -s /opt/brave/Brave "$pkgdir"/usr/bin/brave

	install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

	install -dm0755 "$pkgdir"/usr/share/licenses/brave
	cp --reflink=auto "$srcdir"/MPL2  "$pkgdir"/usr/share/licenses/brave/MPL2
	mv "$pkgdir"/opt/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave/
}

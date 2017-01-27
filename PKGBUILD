# Maintainer: Jacob Mischka <jacob@mischka.me>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
pkgname=brave
pkgver=0.13.0
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('x86_64')
url='https://www.brave.com/'
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libgnome-keyring' 'libxtst' 'libxss' 'ttf-font')
makedepends=('npm' 'git')
optdepends=('cups: Printer support'
            'pepper-flash: Adobe Flash support')
provides=('brave-browser')
source=("https://github.com/brave/browser-laptop/archive/v"$pkgver"dev.tar.gz"
        'brave'
	'brave.desktop')
sha512sums=('8a1f5137f743a28bbd314c42cc08ed7787f7836ac893c3e3091847faa04fad66dee2349184a5036a1e1bf134860816bc5612d9abfca8f5fb1cc6186d3563542d'
            '15c8ddd91dc5da3b20b551593594c23248d4d7945d9635b4240ad23cf9cc605ce83ed3082e75c0376f6a15c5cf0796c0beb4c6721334b3759708a3063f89c47d'
            '337de1b406c89418fb27a49b1a9fa4cfef94eefbf2901bc60f5ddac0b9094924e940fcbcb233cbbeff2742e6b3c26cc6dbdb75cd29798eff8c8be92fce0df2e7')

build() {
	cd "$srcdir"/browser-laptop-"$pkgver"dev

	npm install
	CHANNEL=dev npm run build-package
}

package() {
	cd "$srcdir"/browser-laptop-"$pkgver"dev

	install -dm0755 "$pkgdir"/usr/lib

	cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave

	install -Dm0644 "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

	install -Dm0755 "$srcdir"/brave "$pkgdir"/usr/bin/brave

	install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

	install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/brave/MPL2

	mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave/

	ln -s /usr/lib/PepperFlash "$pkgdir"/usr/lib/pepperflashplugin-nonfree
}

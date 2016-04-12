# Maintainer: Jacob Mischka <jacob@mischka.me>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
pkgname=brave
pkgver=0.9.1
pkgrel=1
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('x86_64')
url='https://www.brave.com/'
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils' 'ttf-font')
makedepends=('npm')
install="$pkgname".install
provides=('brave-browser')
source=("https://github.com/brave/browser-laptop/archive/v"$pkgver"dev.tar.gz"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
	'brave.desktop')
sha384sums=('b8c779c62230987125b59803bf22c863734a7291f5ee5c5dd6f6d7f1e5b540c78ae0d3065b6f3a26ef1124c2da85a32a'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f')

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

	install -dm0755 "$pkgdir"/usr/bin

	ln -s /usr/lib/brave/brave "$pkgdir"/usr/bin/brave

	install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

	install -dm0755 "$pkgdir"/usr/share/licenses/brave

	cp --reflink=auto "$srcdir"/MPL2  "$pkgdir"/usr/share/licenses/brave/MPL2

	mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave/
}

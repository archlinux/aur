# Maintainer: Jacob Mischka <jacob@mischka.me>
# Comaintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
pkgname=brave
pkgver=0.12.3
pkgrel=1.5
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('x86_64')
url='https://www.brave.com/'
license=('custom')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libxss' 'ttf-font')
makedepends=('npm' 'git')
provides=('brave-browser')
#source=("https://github.com/brave/browser-laptop/archive/"$pkgver"dev.tar.gz"
source=("https://github.com/brave/browser-laptop/archive/0.12.3dev-RC5.tar.gz"
        "MPL2::https://raw.githubusercontent.com/brave/browser-laptop/master/LICENSE.txt"
	'brave.desktop')
sha384sums=('7e4091ac0047c80c271980463528d31660aba018b00b8958307726b6d4c7dd4132f082daa8b7ff05617ad9c129e40338'
            'b27caa103555393992e6e1de1c2663f3ecf8339054e1aee8961406c8cbc9d677ba78b4bab6efe7210143818f9207d16b'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f')

build() {
	#cd "$srcdir"/browser-laptop-"$pkgver"dev
	cd "$srcdir"/browser-laptop-"$pkgver"dev-RC5

	npm install
	CHANNEL=dev npm run build-package
}

package() {
	#cd "$srcdir"/browser-laptop-"$pkgver"dev
	cd "$srcdir"/browser-laptop-"$pkgver"dev-RC5

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

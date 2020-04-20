# Maintainer: Paragoumba <paragoumba at protonmail dot com>
pkgname=open-joystick-display
pkgver=2.8.0
pkgrel=2
pkgdesc="A powerful and easy to use streamer-ready overlay for your joystick or gamepad. Completely free and open source."
arch=("x86_64")
url="https://ojdproject.com/"
license=('BSD')
depends=(libxss gtk3 nss)
makedepends=('nvm')
changelog= # TODO "CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://github.com/KernelZechs/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('20c6af63306b719983b34c487b65c734ee0f6805fd8c2942630ce1c3ec8a0214')

prepare() {
	cd "$pkgname-$pkgver"
	source /usr/share/nvm/init-nvm.sh
	nvm install 12
	nvm use 12
	npm install yarn gulp && rm package-lock.json && node_modules/yarn/bin/yarn install	
}

build() {
	cd "$pkgname-$pkgver"
	node_modules/gulp/bin/gulp.js build && node_modules/gulp/bin/gulp.js rebuild-electron && node_modules/yarn/bin/yarn electron-builder --linux dir
}

package() {
	install -Dm 644 ../"$pkgname".desktop -t "$pkgdir"/usr/share/applications/
	
	cd "$pkgname-$pkgver"
	install -Dm 644 app/icons/icon.png "$pkgdir"/usr/share/pixmaps/open-joystick-display.png
	install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm 755 "$pkgdir"/opt/open-joystick-display/	
	
	cp -r dist/linux-unpacked/* "$pkgdir"/opt/open-joystick-display/

	mkdir -p "$pkgdir/usr/bin/"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

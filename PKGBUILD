# Maintainer: Jacob Mischka <jacobmischka@gmail.com>
pkgname=brave
pkgver=0.7.10dev
pkgrel=2
pkgdesc='Web browser that blocks ads and trackers by default.'
arch=('i686' 'x86_64')
url='https://www.brave.com/'
license=('custom':"MPL2")
depends=('nodejs>5.5')
makedepends=('npm')
source=("https://github.com/brave/browser-laptop/archive/v${pkgver}.tar.gz" "Brave.desktop")
sha256sums=('86d4f1f58f1326decc236006a316c5370b3022338758b27bb9d1ee392c37d6ee' '37cea2a14b5990636e15db1ae58f095116adc3fffb0c628ded9c1eae92c5b233')

build() {
	cd "${srcdir}/browser-laptop-${pkgver}"
	npm install node-gyp@3.2.1
	npm install
	npm run build-package
}

package() {
	case $CARCH in
	    'i686') _arch='x86';;
	    'x86_64') _arch='x64';;
	esac

	# Install files
	cd "${srcdir}/browser-laptop-${pkgver}"
	install -d "${pkgdir}/opt/brave"
	cp -a "Brave-linux-${_arch}/." "${pkgdir}/opt/brave"

	chmod 755 "${pkgdir}/opt/brave/Brave"

	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/Brave.desktop" "${pkgdir}/usr/share/applications"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/brave/Brave" "${pkgdir}/usr/bin/brave"

	install -d "${pkgdir}/usr/share/pixmaps"
	install "res/app.png" "${pkgdir}/usr/share/pixmaps/brave.png"

	install -Dm644 "${pkgdir}/opt/brave/LICENSE" "${pkgdir}/usr/share/licenses/brave/LICENSE"
	rm "${pkgdir}/opt/brave/LICENSE"
}

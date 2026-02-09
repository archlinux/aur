# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=deemix-fix-gui
pkgver=0.0.0
pkgrel=1
pkgdesc="A GUI electron app for the deemix library - download music from deezer"
url=https://gitlab.com/C0rn3j/DeemixFix
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=('deemix')
conflicts=('deemix-gui-appimage')
depends=('hicolor-icon-theme' 'electron')
makedepends=('git' 'python' 'libxcrypt-compat' 'npm' 'pnpm' 'cairo' 'nodejs')
source=(
	"git+https://gitlab.com/C0rn3j/DeemixFix.git#commit=d2bb3f59e968308d2a5c328fd05f74f643566e8c"
	'deemix-gui.desktop'
)
sha256sums=(
	'SKIP'
	'7a2542aa9b3f37cd879a240d69fab5c3af71af44b5237bc61c5bf2017f4690b7'
)

build() {
	cd ${srcdir}/DeemixFix

	pnpm install

	cd server && npm install
	cd ../webui && npm install
	cd ../deemix && npm install
	cd ../deezer-js && npm install
	cd ../spotify-web-api-node && npm install
	cd ..

	pnpm dist
}

package(){
	install -dm755 ${pkgdir}/opt/deemix-fix
	install -dm755 ${pkgdir}/usr/bin

	cp -rf ${srcdir}/DeemixFix/dist/linux-unpacked/* ${pkgdir}/opt/deemix-fix
	ln -s /opt/deemix-fix/deemix-fix ${pkgdir}/usr/bin/deemix-gui

	install -Dm755 ${srcdir}/deemix-gui.desktop -t ${pkgdir}/usr/share/applications
}

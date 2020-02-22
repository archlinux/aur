# Maintainer: Julien Savard <juju at juju2143 dot ca>
pkgname=ticemu-git
pkgver=2.0dev.r2073.fd0b11d9
pkgrel=1
pkgdesc="An open-source third-party TI-84 Plus CE / TI-83 Premium CE calculator emulator"
arch=("i686" "x86_64")
url="https://github.com/CE-Programming/CEmu"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-declarative')
makedepends=('git')
provides=("ticemu")
conflicts=("ticemu")
replaces=()
backup=()
options=()
install=
source=('ticemu::git+https://github.com/CE-Programming/CEmu' 'ticemu.desktop')
noextract=()
md5sums=('SKIP'
         'c575a2907d353a7de6813004daf5fae9')

pkgver() {
	cd "$srcdir/${pkgname%-git}/gui/qt"
	printf "%s.r%s.%s" "$(cat CEmu.pro | grep 'CEMU_VERSION =' | grep -o '[^=]*$' | tail -n1 |sed 's# ##g'|sed 's#^v##g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git submodule update
	cd "$srcdir/${pkgname%-git}/gui/qt"
	qmake-qt5 -r CEmu.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/gui/qt"
	install -D -m755 "${srcdir}/${pkgname%-git}/gui/qt/CEmu" "$pkgdir/usr/bin/ticemu"
	install -D -m644 "${srcdir}/${pkgname%-git}/README.md" "$pkgdir/usr/share/${pkgname%-git}/README"
	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname%-git}/gui/qt/resources/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -D -m644 "${srcdir}/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}

# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-emulator-git
pkgver=r37.r0.g946284d
pkgrel=1
pkgdesc="An emulator for The 8-Bit Guy's Commander X16"
arch=('x86_64')
url="http://commanderx16.com/"
license=('BSD')
groups=('commander-x16')
depends=('sdl2')
makedepends=('git' 'pandoc' 'gendesk')
optdepends=('x16-rom: ROMs for the emulator')
provides=('x16-emulator')
conflicts=('x16-emulator')
replaces=()
options=()
install=
changelog=
source=("git+https://github.com/commanderx16/x16-emulator.git"
	"modify-base-path.patch")
md5sums=('SKIP'
	'5cd0550d2af1b4267c9b9f30eed9691e')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	patch -uN main.c ../modify-base-path.patch
	gendesk -f -n --pkgname "${pkgname%-git}" --pkgdesc "$pkgdesc" --name "X16 Emulator" --icon "${pkgname%-git}" --exec "x16emu" --categories "Game;Emulator"
}

build() {
	cd "${pkgname%-git}"
	make
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="X16 Emulator" README.md --output README.html
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 x16emu "$pkgdir/usr/bin/x16emu"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-git}/github-pandoc.css"
	install -Dm644 README.html "$pkgdir/usr/share/doc/${pkgname%-git}/README.html"
	install -Dm644 .gh/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	install -Dm644 "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}

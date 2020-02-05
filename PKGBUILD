# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-emulator-git
pkgver=r31.r2.g6bf9d9e
pkgrel=2
pkgdesc="An emulator for The 8-Bit Guy's Commander X16"
arch=('x86_64')
url="http://commanderx16.com/"
license=('BSD')
groups=('commander-x16')
depends=('sdl2')
makedepends=('git' 'pandoc')
optdepends=('x16-rom: ROMs for the emulator')
provides=('x16-emulator')
conflicts=('x16-emulator')
replaces=()
options=()
install=
changelog=
source=("git+https://github.com/mist64/x16-emulator.git"
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
}

build() {
	cd "${pkgname%-git}"
	make WITH_YM2151=1
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="X16 Emulator" README.md --output README.html
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 x16emu "$pkgdir/usr/bin/x16emu"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-git}/github-pandoc.css"
	install -Dm644 README.html "$pkgdir/usr/share/doc/${pkgname%-git}/README.html"
}

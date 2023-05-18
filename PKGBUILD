# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Julien Savard <juju@juju2143.ca>
pkgname=x16-rom-git
pkgver=r43.r1.g1866bb7
pkgrel=1
pkgdesc="ROM files for The 8-Bit Guy's Commander X16"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=('git' 'cc65' 'pandoc')
optdepends=('x16-emulator-git: emulator for the ROMs')
provides=('x16-rom')
conflicts=('x16-rom')
replaces=()
options=()
install=x16-rom.install
changelog=
source=("git+https://github.com/X16Community/x16-rom.git"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/master/github-pandoc.css")
sha256sums=('SKIP'
            '43e06186556036c7a40db6b743892b2cd7f150ffed5ea1e9fe3db0a6ceb23ff5')

pkgver() {
        cd "${pkgname%-git}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	_pkgver1=${pkgver#r}
	make PRERELEASE_VERSION=${_pkgver1%%[^0-9]*}
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="X16 KERNAL/BASIC/DOS ROM" README.md --output KERNAL-BASIC.html
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 build/x16/rom.bin "$pkgdir/usr/share/${pkgname%-git}/rom.bin"
	install -Dm644 build/x16/rom_labels.h "$pkgdir/usr/include/x16/rom_labels.h"
	install -Dm644 ../github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-git}/github-pandoc.css"
	install -Dm644 KERNAL-BASIC.html "$pkgdir/usr/share/doc/${pkgname%-git}/KERNAL-BASIC.html"
}


# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-rom-git
pkgver=r30.r18.ge3815b4
pkgrel=1
pkgdesc="ROM files for The 8-Bit Guy's Commander X16"
arch=('any')
url="http://commanderx16.com/"
license=('unknown' 'GPL3')
groups=('commander-x16')
depends=()
makedepends=('git' 'cc65' 'pandoc')
optdepends=()
provides=('x16-rom')
conflicts=('x16-rom')
replaces=()
options=()
install=
changelog=
source=("git+https://github.com/commanderx16/x16-rom.git"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/master/github-pandoc.css"
	"https://raw.githubusercontent.com/mobluse/chargen-maker/master/chargen.txt")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
        cd "${pkgname%-git}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	make
	# Stolen from https://github.com/mobluse/chargen-maker, under GPL3
	sed '/^#/d;/^[[:space:]]*$/d;s/\\/0/g;s/@/1/g;' < ../chargen.txt | perl -ne 'print pack("B8", $_)' > chargen.bin
	pandoc --from gfm --to html -c ../github-pandoc.css --standalone --metadata pagetitle="X16 KERNAL/BASIC/DOS ROM" README.md --output KERNAL-BASIC.html
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 rom.bin "$pkgdir/usr/share/${pkgname%-git}/rom.bin"
	install -Dm644 rom-c64.bin "$pkgdir/usr/share/${pkgname%-git}/rom-c64.bin"
	install -Dm644 chargen.bin "$pkgdir/usr/share/${pkgname%-git}/chargen.bin"
	install -Dm644 ../github-pandoc.css "$pkgdir/usr/share/doc/${pkgname%-git}/github-pandoc.css"
	install -Dm644 KERNAL-BASIC.html "$pkgdir/usr/share/doc/${pkgname%-git}/KERNAL-BASIC.html"
}

# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=candle-git
pkgver=v1.1.r98.3f763bc
pkgrel=1
pkgdesc="GRBL controller application with G-Code visualizer written in Qt - development version"
arch=(x86_64 aarch64)
url="https://github.com/Denvi/Candle"
license=('GPL3')
groups=()
depends=('qt5-serialport' 'qt5-base' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
replaces=()
backup=()
options=()
install=
source=(
    "${pkgname%-git}"::'git+https://github.com/Denvi/Candle.git'
    "${pkgname%-git}.desktop"
    "frmmain.cpp.patch"
)
noextract=()
md5sums=('SKIP'
         'af12719ddf48d7fbef120adb03ab3cdb'
         '54cf1510a9858074b6bf54c0c174dd00')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --match 'v*' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply < "$srcdir/frmmain.cpp.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd src/
	qmake candle.pro
	make
}

package() {
    install -m644 "$srcdir"/"${pkgname%-git}.desktop" -Dt "$pkgdir"/usr/share/applications
	cd "$srcdir/${pkgname%-git}"
    install -m644 src/images/icon.svg -D "$pkgdir"/usr/share/icons/hicolor/scalable/apps/candle.svg
    install -m755 src/Candle -Dt "$pkgdir"/usr/bin
}

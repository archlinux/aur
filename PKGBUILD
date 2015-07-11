# Maintainer: Simon Schuster $(echo "aur . remove stuff like this . schuster.re" | sed 's/ . remove stuff like this . /@/g')

pkgname=inklingreader-git
_pkgname=inklingreader
pkgver=0.8.r34.g97827c7
pkgrel=2
pkgdesc="A GNU/Linux-friendly version of the Wacom Inkling SketchManager."
arch=('i686' 'x86_64')
url="https://github.com/roelj/inklingreader"
license=('GPL3')
depends=('librsvg' 'libusb' 'gtk3')
provides=("${_pkgname%-git}")
conflicts=("${_pkgname%-git}")
optdepends=('inkscape: To use the inkscape plugin')
# gcc, automake, autoconf, make are already part of base devel
makedepends=('git')
source=("git+https://github.com/roelj/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git tags, unannotated, starting with "v"
	printf "%s" "$(git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	autoreconf -i || exit 1
	./configure --prefix=/usr || exit 1
	make || exit 1
}

package() {
	cd "$srcdir/${pkgname%-git}"

    make DESTDIR="$pkgdir/" install || exit 1

	mkdir -p "$pkgdir/usr/share/inkscape/extensions"
	install -Dm644 -t "$pkgdir/usr/share/inkscape/extensions" \
	   		./res/inkscape-extension/wpi2svg-ext.py \
		   	./res/inkscape-extension/wpi_input.inx

    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

	install -Dm644 ./res/InklingReader.svg \
    	"$pkgdir/usr/share/icons/hicolor/scaleable/apps/InklingReader.svg"

	install -Dm644 ./res/InklingReader_128.png \
    	"$pkgdir/usr/share/icons/hicolor/128x128/apps/InklingReader.png"

	install -Dm644 ./res/inklingreader.desktop \
		"$pkgdir/usr/share/applications/inklingreader.desktop"
}

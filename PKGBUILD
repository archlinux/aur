# Maintainer: Simon Repp <simon@fdpl.io>
# Contributor: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=vpaint-git
pkgver=1.7.r22.g5805751
pkgrel=1
pkgdesc='VPaint is an experimental vector graphics editor based on the Vector Animation Complex technology. (git version)'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glu' 'qt5-base' 'libxkbcommon-x11')
makedepends=('gendesk' 'icoutils' 'git')
url='https://www.vpaint.org'
conflicts=('vpaint')
provides=()
source=('vpaint-git::git+https://github.com/dalboris/vpaint.git')
md5sums=('SKIP')

prepare() {
	icotool -x -o $srcdir/vpaint.png $srcdir/$pkgname/src/Gui/images/VPaint.ico
	gendesk -f \
					--categories "Graphics;2DGraphics;VectorGraphics" \
					--comment "Start VPaint" \
					--custom "Icon=/usr/share/pixmaps/vpaint.png" \
					--exec vpaint \
					--name="VPaint" \
					--pkgdesc "Vector graphics editor" \
					--pkgname "$pkgname"
}

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	mkdir -p "$srcdir/$pkgname/build"
	cd       "$srcdir/$pkgname/build"

	export QT_SELECT=5

	qmake ../src/VPaint.pro -r -spec linux-g++ QMAKE_CXXFLAGS+="-fno-delete-null-pointer-checks"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"

	install -Dm755 "$srcdir/$pkgname/build/Gui/VPaint" "$pkgdir/usr/bin/vpaint"
	install -Dm644 "$srcdir/vpaint.png" "$pkgdir/usr/share/pixmaps/vpaint.png"
	install -Dm644 "vpaint.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

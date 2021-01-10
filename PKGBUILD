# Maintainer: Simon Repp <simon@fdpl.io>
# Contributor: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=vpaint
pkgver=1.7
pkgrel=1
pkgdesc='VPaint is an experimental vector graphics editor based on the Vector Animation Complex technology.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glu' 'qt5-base' 'libxkbcommon-x11')
makedepends=('gendesk' 'icoutils')
url='https://www.vpaint.org'
conflicts=('vpaint-git')
provides=()
source=("https://github.com/dalboris/vpaint/archive/v$pkgver.tar.gz")
md5sums=('f714e2bd6569e08e16f89e22cfbcb2dd')

prepare() {
	icotool -x -o $srcdir/vpaint.png $srcdir/$pkgname-$pkgver/src/Gui/images/VPaint.ico
	gendesk -f --pkgname "$pkgname" --pkgdesc "Vector graphics editor" --name="VPaint" \
            --comment "Start VPaint" --exec "$pkgname" --categories "Graphics"         \
            --custom "Icon=/usr/share/pixmaps/vpaint.png"
}

build() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
	cd       "$srcdir/$pkgname-$pkgver/build"

	export QT_SELECT=5

	qmake ../src/VPaint.pro -r -spec linux-g++ QMAKE_CXXFLAGS+="-fPIC -fno-delete-null-pointer-checks"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"

	install -Dm755 "$srcdir/$pkgname-$pkgver/build/Gui/VPaint" "$pkgdir/usr/bin/vpaint"
	install -Dm644 "$srcdir/vpaint.png" "$pkgdir/usr/share/pixmaps/vpaint.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

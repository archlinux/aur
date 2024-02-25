# Maintainer: éclairevoyant
# Contributor: Kyle Keen <keenerd at gmail dot com>

pkgname=teapot
pkgver=2.3.0
pkgrel=3
pkgdesc="Table Editor and Planner: a 3D curses based spreadsheet for mathy people"
arch=('i686' 'x86_64')
url="https://www.syntax-k.de/projekte/teapot"
license=('GPL3')
depends=(ncurses)
makedepends=(cmake fltk libtirpc)
optdepends=('fltk: for gui')
source=("$url/$pkgname-$pkgver.tar.gz"
        "$url/Teapot-$pkgver-win32.zip")
b2sums=('e22e22573e0ca3b55718a12bed933b14e18ddf078a26a4fe9d782e62d28b2a6fe1603ff4c024f760dd4f5a4b31ac540086de6681f1db81bf64941018067c25ae'
        'dccb09c32a68211790edc85468b48389f66e69f312f3b033f83a833cb005ae6122a493ebaa73ec4f6873564cc446c3d26ed8fe0e26ad34953c484f7e2b551fb4')

prepare() {
	sed -i 's|include("${FLTK_USE_FILE}")|include_directories("${FLTK_INCLUDE_DIRS}")|' \
		$pkgname-$pkgver/CMakeLists.txt
}

build() {
	export CFLAGS+=" -I/usr/include/tirpc"
	# missing symbols when --as-needed is used
	export LDFLAGS+=" -Wl,--no-as-needed -ltirpc"
	cmake -B build -S $pkgname-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build teapot
}

package() {
	install -Dm755 build/teapot -t "$pkgdir/usr/bin/"

	pushd $pkgname-$pkgver
	install -Dm644 teapot.1 -t "$pkgdir/usr/share/man/man1/"
	mkdir "$pkgdir/usr/share/teapot/"
	cp -r examples -t "$pkgdir/usr/share/teapot/"
	popd

	pushd Teapot-$pkgver-win32
	find . -type f -exec chmod -x '{}' \;
	cp -r share/doc/teapot -t "$pkgdir/usr/share/"
	popd
}


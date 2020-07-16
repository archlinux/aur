# Maintainer: Bruce Zhang
pkgname=qt-scrcpy
_name=QtScrcpy
pkgver=1.4.1
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('qt5-base' 'scrcpy' 'qt5-x11extras')
provides=('qt-scrcpy')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/barry-ran/$_name/archive/v$pkgver.tar.gz"
	binaries.patch
)
sha256sums=('0acf4355a4ba05c1f55711188d98e52ced249ff5bc3f8fc1859ff20ecf5b4a18'
            '1fa61a24bf59a62db1b29a3d3ec49186ef6f539ff8d09dd04534d939cb30aedd')

prepare() {
	cd "$srcdir/$_name-$pkgver/$_name"
	patch < "$srcdir/binaries.patch"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	mkdir build
	cd build
	qmake ../all.pro CONFIG+=qtquickcompiler
	make qmake_all
	sed -ie '/^CXXFLAGS/s/$/ -Wno-deprecated-declarations/' QtScrcpy/Makefile
	make
}

package() {
	cd "$srcdir/$_name-$pkgver/output/linux/release"
	install -Dm755 QtScrcpy "$pkgdir/usr/bin/QtScrcpy"
}

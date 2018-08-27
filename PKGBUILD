# Maintainer: Egor Panasenko <gaura.panasenko@gmail.com>

pkgname=ponyprog
pkgver=V2_08d.r281.e0ea8ee
pkgrel=6
pkgdesc="PonyProg is a serial device programmer based on some simple and cheap interfaces for the PC"
arch=('any')
url="http://www.LancOS.com"
license=('GPLv2')
depends=("qt5-base" "qt5-multimedia")
makedepends=("coreutils" "git" "cmake")
source=("git://github.com/lancos/${pkgname}.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CPU_NUM=$(nproc --all)
	DIRECTORY="build"
	install -m755 -d "$DIRECTORY"
	cd "$DIRECTORY"
	rm * -rf
	cmake -DUSE_DEBUGGER=OFF -DUSE_QT5=ON -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j$CPU_NUM
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}

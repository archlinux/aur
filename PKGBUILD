# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
pkgname=uconfig-git
pkgver=r201.ec531a4
pkgrel=1
pkgdesc="Extract pinout from PDF datasheets and create Kicad schematics"
arch=(x86_64)
url="https://github.com/Robotips/uConfig"
license=('GPL3')
depends=('poppler-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('uconfig::git+https://github.com/Robotips/uConfig.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build && cd build
	qmake ../src/uConfig.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/bin"
	install -d "$pkgdir/usr/lib"
	cp -P --preserve=links lib*.so* "$pkgdir/usr/lib"
	install -Dm755 -t "$pkgdir/usr/bin" uconfig uconfig_gui
	find "$pkgdir/usr/bin" -type f -exec patchelf --remove-rpath '{}' \;
}


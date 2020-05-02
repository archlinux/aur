# Maintainer: Johannes Jordan <jordan@gerbilvis.org>

_pkgname=gerbil
pkgname=$_pkgname-git
pkgver=1.0b
pkgrel=2
pkgdesc="An interactive visualization tool targeted at multispectral and hyperspectral image data"
arch=(i686 x86_64)
url="http://www.gerbilvis.org/"
license=('GPL3')
depends=('boost-libs' 'opencv' 'qt5-base' 'gdal')
makedepends=('boost' 'cmake' 'git')
conflicts=($_pkgname)
source=('git+https://github.com/gerbilvis/gerbil.git' "$_pkgname.desktop")
md5sums=('SKIP' '95c325def4edada78a7841429ec19aa8')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "$srcdir/$_pkgname/build"
}

build() {
	cd "$srcdir/$_pkgname/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	         -DCMAKE_BUILD_TYPE=Release \
	         -DCMAKE_SKIP_RPATH=1
	make
}

package() {
	cd "$srcdir/$_pkgname/build"

	# cli
	install -Dm755 bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"

	# qt4 gui
	install -Dm755 bin/q$_pkgname "$pkgdir/usr/bin/q$_pkgname"

	# desktop file
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# icon
	install -Dm644 ../gui/resources/logo/icon.png "$pkgdir/usr/share/pixmaps/q$_pkgname.png"
}

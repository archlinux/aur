# Maintainer: Thomas Flucke <tflucke@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=openscad-objects-git
_pkg="${pkgname%-objects-git}"
pkgver=2019.05.r2568.gccce0d16f
pkgrel=2
pkgdesc="The programmers solid 3D CAD modeller with experimental support for user-defined objects"
arch=('x86_64')
license=('GPL2')
url='https://github.com/jordanbrown0/openscad'
_branch="objects,geometry-as-data,module-references"
provides=("$_pkg")
conflicts=("$_pkg")
depends=(
	'boost-libs'
	'cgal'
	'libzip'
	'opencsg'
	'qscintilla-qt5'
	'qt5-base'
	'qt5-gamepad'
	'qt5-multimedia'
	'qt5-svg'
	'tbb')
makedepends=('git' 'boost' 'cmake' 'eigen' 'imagemagick' 'python' 'flex' 'bison')
source=("$_pkg::git+$url#branch=$_branch" boost-libs.1.83.0.patch)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^openscad-//;s/-/.r/;s/-/./'
}

prepare() {
    top_dir="$PWD"
    cd "$_pkg"
    git apply "${srcdir}/boost-libs.1.83.0.patch"
    sed -i 's/ping files.openscad.org/ping archlinux.org/' resources/CMakeLists.txt
    git submodule update --init --recursive
    cd submodules/mimalloc
    git checkout v1.8.2
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DEXPERIMENTAL=ON \
		-DOFFLINE_DOCS=ON \
		-Wno-dev
	cmake --build build
	cd "$_pkg/resources/icons/"
	convert openscad.png -resize 128x128\> openscad-128.png
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$_pkg"
	install -Dm644 "resources/icons/openscad.desktop" "$pkgdir/usr/share/applications/openscad.desktop"
	install -Dm644 "resources/icons/openscad-128.png" "$pkgdir/usr/share/pixmaps/openscad.png"
}


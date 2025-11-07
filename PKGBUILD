# Maintainer: Sebastian Frysztak <sebastian@frysztak.dev>
# Contributor: Haoyang Liu <tttturtleruss@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=openscad-git
_pkg="${pkgname%-git}"
pkgver=r11722.da8418b
pkgrel=1
pkgdesc="The programmers solid 3D CAD modeller"
arch=('x86_64')
license=('GPL2')
url='https://github.com/openscad/openscad'
provides=("$_pkg")
conflicts=("$_pkg")
depends=(
    'boost-libs'
    'cgal'
    'libzip'
    'qscintilla-qt6'
    'qt6-base'
    'qt6-svg'
    'qt6-multimedia'
    'qt6-5compat'
    'double-conversion'
    'glew'
    'freetype2'
    'glib2'
    'harfbuzz'
    'fontconfig'
    'gmp'
    'mpfr'
    'tbb'
    'lib3mf'
)
makedepends=('git' 'boost' 'cmake' 'eigen' 'imagemagick' 'python' 'ninja')
source=("$_pkg::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	# git -C "$_pkg" describe --long --tags | sed 's/^openscad-//;s/-/.r/;s/-/./'
    cd "$_pkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkg"
	sed -i 's/ping files.openscad.org/ping archlinux.org/' resources/CMakeLists.txt

	# Eigen5 compat, thanks DarioP
	sed -i 's/Eigen3 3.0/Eigen3 5.0/' CMakeLists.txt
	sed -i 's/target_include_directories(OpenSCAD SYSTEM PRIVATE ${EIGEN3_INCLUDE_DIR})/target_link_libraries(OpenSCAD PRIVATE Eigen3::Eigen)/' CMakeLists.txt
	sed -i 's/target_compile_definitions(OpenSCAD PRIVATE EIGEN_DONT_ALIGN)//' CMakeLists.txt

	git submodule update --init --recursive
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DEXPERIMENTAL=ON \
		-DOFFLINE_DOCS=OFF \
		-DUSE_QT6=ON \
		-DENABLE_TESTS=OFF \
		-DUSE_BUILTIN_OPENCSG=ON \
		-Wno-dev
	cmake --build build --parallel $(expr $(nproc) / 2)
	cd "$_pkg/resources/icons/"
	convert openscad.png -resize 128x128\> openscad-128.png
}

check() {
    cd "$_pkg/scripts"
    echo $PWD
    ./check-dependencies.sh
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$_pkg"
	install -Dm644 "resources/icons/openscad.desktop" "$pkgdir/usr/share/applications/openscad.desktop"
	install -Dm644 "resources/icons/openscad-128.png" "$pkgdir/usr/share/pixmaps/openscad.png"
}



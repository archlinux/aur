# Maintainer: Dan <aur at drmoose dot net>
# Based on openscad-git, which listed the following contributors:
# Contributor: Sebastian Frysztak <sebastian@frysztak.dev>
# Contributor: Haoyang Liu <tttturtleruss@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Torsten Wagner <tottiwagner@yahoo.de>

pkgname=pythonscad-git
_pkg="${pkgname%-git}"
pkgver=r14226.e2ee812
pkgrel=1
pkgdesc="Fork of OpenSCAD allowing models to be written in Python"
arch=('x86_64')
license=('GPL2')
url='https://github.com/pythonscad/pythonscad'
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
    'python'
)
makedepends=('git' 'boost' 'cmake' 'eigen' 'imagemagick' 'ninja' 'bison' 'flex')
source=(
	"$_pkg::git+$url.git"
	"${_pkg}-MCAD::git+https://github.com/openscad/MCAD.git"
	"${_pkg}-mimalloc::git+https://github.com/microsoft/mimalloc.git"
	"${_pkg}-manifold::git+https://github.com/elalish/manifold.git"
	"${_pkg}-libfive::git+https://github.com/libfive/libfive.git"
	"${_pkg}-sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake.git"
	"${_pkg}-OpenCSG::git+https://github.com/floriankirsch/OpenCSG.git"
	"${_pkg}-Clipper2::git+https://github.com/AngusJohnson/Clipper2.git"
)

sha256sums=(
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
)

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

	git submodule init
	git config 'submodule.libraries/MCAD.url' "$srcdir/${_pkg}-MCAD"
	git config 'submodule.mimalloc.url' "$srcdir/${_pkg}-mimalloc"
	git config 'submodule.submodules/manifold.url' "$srcdir/${_pkg}-manifold"
	git config 'submodule.submodules/libfive.url' "$srcdir/${_pkg}-libfive"
	git config 'submodule.sanitizers-cmake.url' "$srcdir/${_pkg}-sanitizers-cmake"
	git config 'submodule.OpenCSG.url' "$srcdir/${_pkg}-OpenCSG"
	git config 'submodule.Clipper2.url' "$srcdir/${_pkg}-Clipper2"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DEXPERIMENTAL=ON \
		-DOFFLINE_DOCS=OFF \
		-DUSE_QT6=ON \
		-DENABLE_TESTS=OFF \
		-DUSE_BUILTIN_OPENCSG=ON \
		-DENABLE_PYTHON=ON \
		-Wno-dev
	cmake --build build --parallel $(expr $(nproc) / 2)
}

check() {
    cd "$_pkg/scripts"
    echo $PWD
    ./check-dependencies.sh
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "$_pkg"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "resources/icons/$_pkg.desktop" "$pkgdir/usr/share/applications/$_pkg.desktop"
	install -Dm644 "resources/icons/${_pkg}-128.png" "$pkgdir/usr/share/pixmaps/$_pkg.png"
}



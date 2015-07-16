# Maintainer: Mykola Dolhyi <0xb000@gmail.com>
pkgname=ignition-math-hg
pkgver=2.1.1.434
pkgrel=1
pkgdesc="Math classes and functions for robot applications"
arch=('i686' 'x86_64')
url="https://bitbucket.org/ignitionrobotics/ign-math"
license=('Apache')
groups=('development')
depends=()
makedepends=('cmake' 'mercurial' 'ruby-ronn' 'pkg-config>=0.28')
optdepends=()
provides=('ignition-math2')
conflicts=()
replaces=('ignition-math2')
#changelog=
source=("ignition-math::hg+https://bitbucket.org/ignitionrobotics/ign-math")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

_dir=ignition-math

pkgver() {
	cd "$srcdir/$_dir"

	local project_major="$(sed -n 's/set (PROJECT_MAJOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	local project_minor="$(sed -n 's/set (PROJECT_MINOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	local project_patch="$(sed -n 's/set (PROJECT_PATCH_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	printf "%s.%s" "${project_major}.${project_minor}.${project_patch}" "$(hg identify -n)"
}

prepare() {
	cd "$srcdir/$_dir"

	# update from repository
	hg pull

	mkdir -p build
}

build() {
	cd "$srcdir/$_dir/build"

	# Configure build
	cmake .. -DCMAKE_BUILD_TYPE="Release" \
			 -DCMAKE_INSTALL_PREFIX="/usr" \
			 -DCMAKE_INSTALL_LIBDIR="lib" \
			 -DENABLE_TESTS_COMPILATION:BOOL=False

	# Compile
	make -j3
}

package() {
	cd "$srcdir/$_dir/build"
	make DESTDIR="$pkgdir/" install
}

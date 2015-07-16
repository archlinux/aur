# Maintainer: Mykola Dolhyi <0xb000-gmail-com>
pkgname=libsdformat-hg
pkgver=3.0.6.1372
pkgrel=1
pkgdesc="SDF world description lib for gazebo"
arch=('i686' 'x86_64')
url="http://bitbucket.org/osrf/sdformat/"
license=('Apache')
groups=('development' 'simulation')
depends=('boost' 'tinyxml' 'doxygen' 'libtar' 'ignition-math2')
provides=('sdformat')
conflicts=('sdformat')
makedepends=('mercurial' 'cmake' 'ruby')

_hgroot=http://bitbucket.org/osrf
_hgrepo=sdformat
_dir=$_hgrepo

source=("$_hgrepo::hg+$_hgroot/$_hgrepo")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/$_dir"

	local project_major="$(sed -n 's/set (SDF_MAJOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	local project_minor="$(sed -n 's/set (SDF_MINOR_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	local project_patch="$(sed -n 's/set (SDF_PATCH_VERSION \([0-9]\+\))/\1/p' CMakeLists.txt)"
	printf "%s.%s" "${project_major}.${project_minor}.${project_patch}" "$(hg identify -n)"
}

prepare() {
	cd "$srcdir/$_dir"

	hg pull -u

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

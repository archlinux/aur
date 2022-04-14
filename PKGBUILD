# Maintainer: David Castellon <bobosito000 at gmail dot com>

pkgname=mavsdk-git
pkgver=v1.2.0.r18.0c13d0fe
pkgrel=1
pkgdesc="C++ API and library for MAVLink compatible systems."
arch=('i686' 'x86_64')
url="https://mavsdk.mavlink.io/main/en/index.html"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('jsoncpp' 'tinyxml2')

makedepends=('curl' 'make' 'cmake' 'git')
optdepends=()
provides=('mavsdk')
# conflicts=('gazebo')

source=("mavsdk"::"git+https://github.com/mavlink/MAVSDK"
	"git+https://github.com/mavlink/c_library_v2"
	"git+https://github.com/mavlink/mavsdk-proto.git"
	"git+https://github.com/google/googletest.git")

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
md5sums=()
validpgpkeys=()

pkgver() {
	cd $srcdir/mavsdk
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd $srcdir/mavsdk
	git submodule init
	git config submodule.mavsdk-proto.url $srcdir/mavsdk-proto
	git config submodule.googletest.url $srcdir/googletest
	git config submodule.c_library_v2.url $srcdir/c_library_v2
	git submodule update
}

build() {
	cd $srcdir/mavsdk
	
	mkdir -p build && cd build
	
	cmake ..  -DCMAKE_BUILD_TYPE="Release" \
	         -DCMAKE_INSTALL_PREFIX="/usr" \
	         -DCMAKE_INSTALL_LIBDIR="lib" \
		-DBUILD_MAVSDK_SERVER="ON"
	make
}

package() {
  cd "${srcdir}/mavsdk/build"
  DESTDIR="${pkgdir}" make install
}

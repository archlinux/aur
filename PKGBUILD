# MAINTAINER: haagch <christoph.haag@collabora.com>

pkgname=basalt-monado-git
pkgver=r482.b5b52b1
pkgrel=1
pkgdesc="Visual-Inertial Mapping with Non-Linear Factor Recovery"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/mateosss/basalt"
license=('BSD')
depends=('eigen' 'glew' 'libpng' 'lz4' 'bzip2' 'boost' 'gtest' 'opencv' 'libpng' 'lz4' 'bzip2' 'libuvc' 'fmt' 'python')
optdepends=('librealsense: Intel realsense support')
makedepends=('cmake' 'ninja' 'git')
_pkgname="basalt"
source=('git+https://gitlab.freedesktop.org/mateosss/basalt.git#branch=main'
	'279c17d9c9eb9374c89489b449f92cb93350e8cd.patch')
sha256sums=('SKIP'
            '04d4185309a72be30f508a9961c54b5cf69da323f54ea754482a79a999914b4c')
#options=('debug' '!strip')
options=('!strip')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule update --init --recursive

	# https://github.com/stevenlovegrove/Pangolin/issues/657
	cd thirdparty/Pangolin
	git checkout include/pangolin/utils/picojson.h
	git apply ../../../279c17d9c9eb9374c89489b449f92cb93350e8cd.patch
	sed -i '1s/^/#include <stdint.h>\n/' include/pangolin/platform.h
}

build() {
	msg "Starting CMake"
	cd "$_pkgname"

	# -g1: Level 1 produces minimal information, enough for making backtraces in parts of the program that you don’t plan to debug.
	# export CFLAGS="-g1"
	# export CXXFLAGS="$CFLAGS"

	# -DBASALT_BUILD_SHARED_LIBRARY_ONLY=ON remove this if you want to build all of basalt

	cmake \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_BUILD_TYPE="RelWithDebInfo" \
		-DBUILD_TESTS=OFF \
		-DBASALT_INSTANTIATIONS_DOUBLE=OFF \
		-DBASALT_BUILD_SHARED_LIBRARY_ONLY=ON \
		-Bbuild \
		-GNinja

	msg "Building the project"
	ninja -C build
}

package() {
	cd "$_pkgname"

	msg "Installing files"
	DESTDIR="${pkgdir}/" ninja -C build install
}

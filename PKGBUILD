# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=6.0.0
pkgrel=3
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD')
depends=(
	'boost-libs'
	'bzip2'
	'doxygen'
	'expat'
	'intel-tbb'
	'libc++'
	'libosmium'
	'libxml2'
	'libzip'
	'lua'
	'protozero'
)
makedepends=(
	'cmake'
	'boost'
)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a')
b2sums_x86_64=('318ad504099a93585a2ec8d39998e375519f511359fe927718638c5a4dd0221bf15f02babca9ee7f3752f08e7315393370aaf2584f813e34542ccaed08b295fe')

build() {
	local cmake_options=(
		# -B <path-to-build>           = Explicitly specify a build directory.
		# This is relative to /src
		-B build

		# -S <path-to-source>          = Explicitly specify a source directory.
		-S "${srcdir}/${pkgname}-${pkgver}"
		-D CMAKE_BUILD_TYPE=RelWithDebInfo
		# -D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=lib
		-D BUILD_SHARED_LIBS=ON
		-D LUA_INCLUDE_DIR=/usr/include
		-W no-dev
		-D CMAKE_C_FLAGS="-D_FORTIFY_SOURCE=2"
		-D CMAKE_CXX_FLAGS="-D_FORTIFY_SOURCE=2"
	)
	cmake "${cmake_options[@]}"
	# make VERBOSE=1

	echo -e "PWD:<$(pwd)>"
	cmake --build build
}
package() {

	DESTDIR="${pkgdir}/" cmake --install build

	install -Dvm644 -T "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

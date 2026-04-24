# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=26.4.1
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD')
depends=(
	bzip2
	doxygen
	expat
	git
	libosmium
	libxml2
	libzip
	lua
	onetbb
	pkgconf
	protozero
)
# boost-libs
# libc++
makedepends=(
	cmake
	boost
)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT"
"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
	# "${pkgname}-${pkgver}.patch")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a'
        '4b35ebec16f56361c6c5a63564c9c6e96636cf54ec1d52b73c691d94544d0862bafe8f3361b4142cebdbbf97e87c6b6222c88c9383c8780b35c15c24339ed6bb')
        # 'ec09533d0ba993946841912a48fee01161dc09e2cc920e7b80c209163a228bf344a9e716b0ba371774c96ac15ca82a3aba4ad204dd981ab85a10bf31ba668aff')

prepare() {
	cd "${pkgname}-${pkgver}"
	# patch -Np1 -i ../"${pkgname}-${pkgver}.patch"
	
	# for p in ../*.patch; do
	# 	patch -Np1 -i "$p"
	# done
}

build() {
	local cmake_options=(
		# -B <path-to-build>           = Explicitly specify a build directory.
		# This is relative to /src
		-B build

		# -S <path-to-source>          = Explicitly specify a source directory.
		-S "${srcdir}/${pkgname}-${pkgver}"
		# -D CMAKE_BUILD_TYPE=Debug
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

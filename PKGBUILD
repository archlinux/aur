# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=26.5.0
pkgrel=2
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD')
depends=(
	acl
	boost-libs
	brotli
	bzip2
	doxygen
	expat
	flatbuffers
	gcc-libs
	git
	# glibc
	graphviz
	libarchive
	libosmium
	libxml2
	libzip
	lua54
	lz4
	onetbb
	openssl
	pkgconf
	protozero
	xz
	zlib
	zstd
)
# libtool
makedepends=(
	boost
	cmake
	rapidjson
	sol2
	vtzero
)

provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT"
       "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
       "${pkgname}-${pkgver}.patch::${url}/pull/7589.diff")
# "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
	# "${pkgname}-${pkgver}.patch")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a'
        'e7f7c7b292615a55fd283d7e2342e0d447e73555aa3afab1972f279b7b08b289c89d0d821a1ac57ac0afe4f4ce1a404b78f329c74f7f3281b8cfad081e521367'
        '27eaaf313bfcc8485c9d0867c79cf6871e2067ebd1d3b8b43429de101f18799dd17c10a0b301fdfd5e36a41ca4815083058083e9a50e1c1a13a17604d50aa3ec')

prepare() {
	cd "${pkgname}-${pkgver}"

	# cd ${pkgname}
	# git -c protocol.file.allow=always submodule update --init --recursive --depth=1
	# git submodule update --init --recursive --depth=1

	sed -e 's/-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2//' -i CMakeLists.txt
	patch -Np1 -i ../"${pkgname}-${pkgver}.patch"
	
	# for p in ../*.patch; do
	# 	patch -Np1 -i "$p"
	# done
}

build() {
	cd "$pkgname-$pkgver"

	local cmake_options=(
		# -B <path-to-build>           = Explicitly specify a build directory.
		# This is relative to /src
		-B build_osrm-backend

		# -S <path-to-source>          = Explicitly specify a source directory.
		-S "${srcdir}/${pkgname}-${pkgver}"
		# -D CMAKE_BUILD_TYPE=Debug
		# -D CMAKE_BUILD_TYPE=RelWithDebInfo
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=lib
		-D BUILD_SHARED_LIBS=ON
		-D LUA_INCLUDE_DIR=/usr/include/lua5.4
		-W no-dev
		# -D CMAKE_C_FLAGS="-D_FORTIFY_SOURCE=2"
		# -D CMAKE_CXX_FLAGS="-D_FORTIFY_SOURCE=2"
	)
	cmake "${cmake_options[@]}"
	# make VERBOSE=1

	cmake --build build_osrm-backend
}
package() {
	# echo -e "PWD: $(pwd)"
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}/" cmake --install build_osrm-backend
	install -Dvm644 -T "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

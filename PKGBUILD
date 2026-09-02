# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=26.9.0
pkgrel=1
pkgdesc="High performance routing engine written in C++14 designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD-2-Clause') # https://spdx.org/licenses/
	# acl
	# boost
	# brotli
	# gcc-libs
	# git
	# libxml2
	# libzip
	# lz4
	# openssl
	# xz
	# zstd
depends=(
	boost-libs
	bzip2
	expat
	libarchive
	lua54
	onetbb
	zlib
)
# libtool
	# gcc
	# glibc
makedepends=(
	cmake
	doxygen
	flatbuffers
	fmt
	graphviz
	libosmium
	ninja
	pkgconf
	protozero
	qt6-base
	rapidjson
	sol2
	vtzero
)
checkdepends=(
	jq
	nodejs
)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT"
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
       # "${pkgname}-${pkgver}.patch::${url}/pull/7589.diff")
	# "${pkgname}-${pkgver}.patch")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a'
        'c79bf965aac7e7e0a0ab91e9e579d8c247789fc2d345391c691fec132843693433e43c09a265c3c435d31e11395beedcfc1c318e0241ca4ea40bf8101600bd99')
        # '27eaaf313bfcc8485c9d0867c79cf6871e2067ebd1d3b8b43429de101f18799dd17c10a0b301fdfd5e36a41ca4815083058083e9a50e1c1a13a17604d50aa3ec')

prepare() {
	cd "${pkgname}-${pkgver}"
	echo

	# cd ${pkgname}
	# git -c protocol.file.allow=always submodule update --init --recursive --depth=1
	# git submodule update --init --recursive --depth=1

	sed -e 's/-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2//' -i CMakeLists.txt
	# patch -Np1 -i ../"${pkgname}-${pkgver}.patch"

	# for p in ../*.patch; do
	# 	patch -Np1 -i "$p"
	# done
}

build() {
	cd "$pkgname-$pkgver"

	local cmake_options=(
		# -B <path-to-build>           = Explicitly specify a build directory.
		# This is relative to /src
		-B build

		# -S <path-to-source>          = Explicitly specify a source directory.
		# -S "${srcdir}/${pkgname}-${pkgver}"
		# Set to debug to generate debugging symbol output
		# -D CMAKE_BUILD_TYPE=Debug
		# -D CMAKE_BUILD_TYPE=RelWithDebInfo
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_LIBDIR=lib
		-D BUILD_SHARED_LIBS=ON
		-D LUA_INCLUDE_DIR=/usr/include/lua5.4
		# -D LUA_LIBRARIES=/usr/lib/liblua.so
		-W no-dev
		# -D CMAKE_C_FLAGS="-D_FORTIFY_SOURCE=2"
		# -D CMAKE_CXX_FLAGS="-D_FORTIFY_SOURCE=2"
	)
	cmake "${cmake_options[@]}"
	# make VERBOSE=1

	cmake --build build
}
check(){
	# https://github.com/Project-OSRM/osrm-backend/blob/master/docs/testing.md
	# https://deepwiki.com/Project-OSRM/osrm-backend/1.3-building-from-source
	# https://github.com/Project-OSRM/osrm-backend/blob/d8ff021d/docs/testing.md?plain=1#L33-L47

	# pwd is src/
	cd "$pkgname-$pkgver"
	echo -e "PWD::$(pwd)" # /build/osrm-backend/src/osrm-backend-26.5.0
 
	echo -e "# ----------------------------------------------------"
	echo -e "# Prepare the test data by preprocessing the dataset"
	echo -e "# ----------------------------------------------------"
	cd test/data/
	echo -e "PWD::$(pwd)"
	make

	
	echo -e "# -----------------------------"
	echo -e "# Build the unit tests"
	echo -e "# -----------------------------"
	echo -e "PWD::$(pwd)"
	cd ../../build/
	# cd build
	echo -e "PWD::$(pwd)"
	echo -e "------------------------- cmake .. ----------------------------"
	local cmake_options=(
		# --debug-output
		# Code fails without these supressions
		-D CMAKE_C_FLAGS="-Wno-error=uninitialized"
		-D CMAKE_CXX_FLAGS="-Wno-error=uninitialized"
		-W no-dev
	)
	# cmake -j$(nproc) tests
	cmake "${cmake_options[@]}" ..
	echo -e "PWD::$(pwd)"

	echo -e "------------------------- make tests ----------------------------"
	make tests
	# make --debug=a tests
	echo -e "PWD::$(pwd)"
	# cd build
	echo -e "PWD::$(pwd)"

	echo -e "# ----------------------------------------------------"
	echo -e "# Run each binary suite individually"
	echo -e "# ----------------------------------------------------"
	# You should see the compiled binaries in `build/unit_tests`, you can then run each suite individually:
	for i in ./unit_tests/*-tests ; do 
	    echo "Running $i"
	    $i
	done
}

package() {
	# echo -e "PWD: $(pwd)"
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}/" cmake --install build
	# install -Dvm644 -T "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dvm644 -T ./LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: Julien Desgats <julien at desgats dot fr>

pkgname=osrm-backend
pkgver=26.10.0
_gaucherspkgver=0.1.0
pkgrel=1
pkgdesc="High performance routing engine - C++ backend with gauche-rs integration designed to run on OpenStreetMap data."
arch=('x86_64')
url="https://github.com/Project-OSRM/${pkgname}"
license=('BSD-2-Clause') # https://spdx.org/licenses/
depends=(
	boost-libs
	bzip2
	expat
	libarchive
	lua54
	onetbb
	zlib
)
makedepends=(
	cmake
 	curl
	doxygen
	git
	rustup
	sol2
	vtzero
	flatbuffers
	fmt
	graphviz
	libosmium
	pkgconf
	protozero
	qt6-base
	rapidjson
	tar
	unzip
	zip
) 
checkdepends=(
	jq
	nodejs
)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}-LICENSE::${url/github/raw.githubusercontent}/refs/heads/master/LICENSE.TXT"
	"${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
        "gauche-rs::git+https://github.com/Project-OSRM/gauche-rs.git#tag=v${_gaucherspkgver}")

b2sums=('7e714e99eaea01b1ce336c74e2f4a6f5af6aa059ef16d0e353864c7e188df88682ea5a41b94d42e6daeabfd96e7f352790e04a0bb273c1633747c17e5c348f5a'
        'eff2c8fc85d75157ee91d10514623bb74a45b0d7a7fe6072c352df236882751bb80a14ee0de1cf5052633c6b196dab2d8a924c3b37cbf64e1ea1b7a390644f74'
        '5e86da1c66d44d2636ebb852d07467324f7bfd98c56606e43c7ff099debf7d6333b5c3683f6a0a8952d599d1701134aa492dff2eb90864420a8b327e1f128302')

prepare() {
	cd "${pkgname}-${pkgver}"
	echo
	# Installed by directly linking system files rather than using the suggested method that requires vcpkg as per instructions from 
	# https://github.com/Project-OSRM/osrm-backend/tree/master#building-from-source
	
	echo "# Set up the rust toolchain"
	rustup default stable
	
	echo -e "# ========== Prepare gauche-rs ============="
	echo -e "# 1. Set up Rust environment variables for Arch compliance"
	export CARGO_HOME="${srcdir}/cargo-home"

	echo -e "# 2. Fetch/Vendor Rust dependencies before the build step"
	cd "${srcdir}/gauche-rs"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"


	echo -e "# ========== Build gauche-rs ============="
	export CARGO_HOME="${srcdir}/cargo-home"
  
	cd "${srcdir}/gauche-rs"
	cargo build --release --locked

	echo -e "# ============ In the cpp folder build to create the gaucheCppTargets.cmake file in the target directory ======================="
	echo -e "PWD::$(pwd)"
	cd "${srcdir}/gauche-rs/cpp"
	echo -e "PWD::$(pwd)"
	# Configure and compile the C++ portion
	local cmake_options=(
		-S .
		-B build
		-D GAUCHE_BUILD_EXAMPLES=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS="-fPIC"
		-D CMAKE_CXX_FLAGS="-fPIC"
	)
	cmake "${cmake_options[@]}"
	cmake --build build

	echo -e "# === Install the generated target files into the local target prefix path ==="
	cmake --install build --prefix ${srcdir}/gauche-rs/target


	echo -e "# ============== Prepare the osrm-backend =============="
	cd "${srcdir}/${pkgname}-${pkgver}"

	echo -e "# =================== Modify CMakeLists.txt file ========================"

	echo -e "# 2. Inject add_subdirectory into osrm-backend's root CMakeLists.txt"
	echo -e "# Add add_subdirectory after add_library(osrm... - line 212"
	sed -i "/add_library(osrm::store ALIAS osrm_store)/a # Added via PKGBUILD\nadd_subdirectory(${srcdir}/gauche-rs/cpp ${srcdir}/gauche-rs/target)" CMakeLists.txt  # First path must contain CMakeLists.txt and the second is the binary directory

	echo -e "# 3. Automatically append gauche::cpp linking to osrm-routed target"
	sed -i '/target_link_libraries(osrm/ s/)/ gauche::cpp)/' CMakeLists.txt

}

build() {
	echo -e "# =========== Navigate back to the main osrm-backend build directory ==========="
	cd "${srcdir}/$pkgname-$pkgver"
	echo -e "# ========== Build osrm-backend ============="

	local cmake_options=(
		-B build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_PREFIX_PATH="${srcdir}/gauche-rs/target/lib/cmake/gauche"
		-D CMAKE_INSTALL_LIBDIR=lib
		-D BUILD_SHARED_LIBS=ON
		-D LUA_INCLUDE_DIR=/usr/include/lua5.4
		-W no-author
		-D CMAKE_C_FLAGS="-fPIC"
		-D CMAKE_CXX_FLAGS="-fPIC -Wno-macro-redefined -I ${srcdir}/gauche-rs/target/include"
	)
	cmake "${cmake_options[@]}"
	cmake --build build -j$(nproc)
	echo -e "=== #End of build() PWD::$(pwd) ==="

}

check(){
	# https://github.com/Project-OSRM/osrm-backend/blob/master/docs/testing.md
	# https://deepwiki.com/Project-OSRM/osrm-backend/1.3-building-from-source
	# https://github.com/Project-OSRM/osrm-backend/blob/d8ff021d/docs/testing.md?plain=1#L33-L47

	cd "$pkgname-$pkgver"
	echo -e "# ----------------------------------------------------"
	echo -e "# Prepare the test data by preprocessing the dataset"
	echo -e "# ----------------------------------------------------"
	cd test/data/
	make

	
	echo -e "# -----------------------------"
	echo -e "# Build the unit tests"
	echo -e "# -----------------------------"
	cd ../../build/
	echo -e "# ======================== cmake .. ======================="
	local cmake_options=(
		# Code fails without these supressions
		-D CMAKE_C_FLAGS="-Wno-error=uninitialized -fno-lto" # -Wno-error"
		-D CMAKE_CXX_FLAGS="-Wno-error=uninitialized -I ${srcdir}/gauche-rs/target/include -fno-lto" # -Wno-error"
		-W no-author
		-D ENABLE_LTO=OFF
	)
	cmake "${cmake_options[@]}" ..
	echo -e "PWD::$(pwd)"

	echo -e "# ======================= make tests (ctest --output-on-failure) ========================="
	local excluded_tests=""
  	local ctest_flags=(
    		--test-dir .
		# show the stdout and stderr when the test fails
		--output-on-failure
		# execute tests in parallel
		--parallel $(nproc)
		# exclude problematic tests from above string
		--exclude-regex "$excluded_tests"
		)
  	ctest "${ctest_flags[@]}"

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
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}/" cmake --install build
	install -Dvm644 -T ./LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	
	# Optional: Install standard profiles (car, bicycle, foot) to a shared environment directory
	install -d "${pkgdir}/usr/share/osrm/profiles"
	cp -r "${srcdir}/${pkgname}-${pkgver}/profiles/"* "${pkgdir}/usr/share/osrm/profiles/"
}

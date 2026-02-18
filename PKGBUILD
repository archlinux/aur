# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>

pkgname=evmone
pkgver=0.17.0
pkgrel=1
_evmc_version=12.1.0
_intx_version=0.13.0
_blst_version=0.3.15
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake cli11 benchmark nlohmann-json)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ethereum/evmone/archive/refs/tags/v${pkgver}.tar.gz"
	"evmc-${_evmc_version}.tar.gz::https://github.com/ethereum/evmc/archive/refs/tags/v${_evmc_version}.tar.gz"
	"intx-${_intx_version}.tar.gz::https://github.com/chfast/intx/archive/v${_intx_version}.tar.gz"
	"blst-${_blst_version}.tar.gz::https://github.com/supranational/blst/archive/refs/tags/v${_blst_version}.tar.gz"
)
noextract=("blst-${_blst_version}.tar.gz")
sha256sums=(
	d947142c2ed261f9156120302539fe73a13f09abe9e0d21948ad2099dcd89831
	0d5458015bf38a5358fad04cc290d21ec40122d1eb6420e0b33ae25546984bcd
	849577814e6feb9d4fc3f66f99698eee51dc4b7e3e035c1a2cb76e0d9c52c2e5
	9e503ff6b50e044efb075d260c81c751702b3ed6f2e45394b0833834e71c3afa
)

prepare()
{
	# blst source tarball must be placed in the build dir or the project's CMake will attempt to download it.
	mkdir --parents "build/deps/src/"
	ln --symbolic --force \
		"${startdir}/blst-${_blst_version}.tar.gz" \
		"build/deps/src/v${_blst_version}.tar.gz"

	# The repo has submodules, but in the source package they're just empty dirs.
	# NOTE: Ignoring the test/evm-benchmarks submodule. We're not going to run benchmarks here.
	cd "${pkgname}-${pkgver}/"
	rmdir evmc/
	ln --symbolic "../evmc-${_evmc_version}/" evmc
	touch evmc/.git
}

build ()
{
	local intx_dir="${srcdir}/intx-${_intx_version}"

	mkdir --parents deps/

	# TODO: Make this a separate package
	echo "Building intx..."
	cmake \
		-B "${intx_dir}/build/" \
		-S "${intx_dir}/" \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=None \
		-D INTX_BENCHMARKING=OFF \
		-D INTX_FUZZING=OFF \
		-D INTX_TESTING=OFF \
		-D CMAKE_INSTALL_PREFIX=/usr/
	cmake --build "${intx_dir}/build/"
	DESTDIR=deps/ \
		cmake --install "${intx_dir}/build/"

	# FIXME: For some reason ethash and intx get found when building the evmone target, but not evmone-unittests.
	# The include directory does not get passed to the compiler invocation. This does not happen when they're installed globally.
	# Putting it CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES is a hack that seems to achieve the same effect.
	echo "Building evmone..."
	cmake \
		-B "build/" \
		-S "${pkgname}-${pkgver}/" \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=None \
		-D BUILD_SHARED_LIBS=ON \
		-D EVMONE_TESTING=OFF \
		-D EVMONE_FUZZING=OFF \
		-D EVMC_INSTALL=OFF \
		-D CMAKE_INSTALL_PREFIX=/usr/ \
		-D HUNTER_ENABLED=OFF \
		-D CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES="${srcdir}/deps/usr/include/" \
		-D CMAKE_PREFIX_PATH="${srcdir}/deps/usr/"
	cmake --build build/
}

check()
{
	# NOTE: test/evmone/bench/ contains benchmarks and depends on the evm-benchmarks submodule.
	# A few other tests seem to be benchmarks as well, but they finish quickly enough
	# and do not have such a dependency so they are less of a hassle.
	ctest \
		--output-on-failure \
		--parallel $(nproc) \
		--test-dir build/ \
		--exclude-regex "evmone/bench/.*"
}

package ()
{
	DESTDIR="${pkgdir}/" \
		cmake --install build/

	cd "${pkgname}-${pkgver}/"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -r docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
}

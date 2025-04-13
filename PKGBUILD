# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>

pkgname=evmone
pkgver=0.15.0
pkgrel=1
_evmc_version=12.1.0
_ethash_version=1.1.0
_intx_version=0.12.1
_blst_version=0.3.13
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake cli11 benchmark nlohmann-json)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ethereum/evmone/archive/refs/tags/v${pkgver}.tar.gz"
	"evmc-${_evmc_version}.tar.gz::https://github.com/ethereum/evmc/archive/refs/tags/v${_evmc_version}.tar.gz"
	"ethash-${_ethash_version}.tar.gz::https://github.com/chfast/ethash/archive/v${_ethash_version}.tar.gz"
	"intx-${_intx_version}.tar.gz::https://github.com/chfast/intx/archive/v${_intx_version}.tar.gz"
	"blst-${_blst_version}.tar.gz::https://github.com/supranational/blst/archive/refs/tags/v${_blst_version}.tar.gz"
)
noextract=("blst-${_blst_version}.tar.gz")
sha256sums=(
	6eb2122c98bd86a083015b4e41f46b16df4d9bff608d2bf2f2d985ec18e6d640
	0d5458015bf38a5358fad04cc290d21ec40122d1eb6420e0b33ae25546984bcd
	73b327f3c23f407389845d936c1138af6328c5841a331c1abe3a2add53c558aa
	279a9aa1e46e60f72eb0eb4ea92fec786e02b35069942ed161be7dcfb6700dd8
	89772cef338e93bc0348ae531462752906e8fa34738e38035308a7931dd2948f
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
	local ethash_dir="${srcdir}/ethash-${_ethash_version}"
	local intx_dir="${srcdir}/intx-${_intx_version}"

	mkdir --parents deps/

	# TODO: Add a dependency on the ethash-lib package from AUR instead
	echo "Building ethash..."
	cmake \
		-B "${ethash_dir}/build/" \
		-S "${ethash_dir}/" \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=None \
		-D ETHASH_TESTING=OFF \
		-D CMAKE_INSTALL_PREFIX=/usr/
	cmake --build "${ethash_dir}/build/"
	DESTDIR=deps/ \
		cmake --install "${ethash_dir}/build/"

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
		-D EVMONE_TESTING=ON \
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

	# Building with EVMONE_TESTING=ON produces a bunch of extra binaries meant for testing the package.
	# Some of them are even install targets, but we don't want them in the package.
	rm "${pkgdir}/usr/bin/evmone-bench"
	rmdir "${pkgdir}/usr/bin/"

	cd "${pkgname}-${pkgver}/"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -r docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
}

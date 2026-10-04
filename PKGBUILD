# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>

pkgname=evmone
pkgver=0.22.0
pkgrel=1
_intx_version=0.15.0
_blst_version=0.3.16
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake cli11 benchmark nlohmann-json)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ethereum/evmone/archive/refs/tags/v${pkgver}.tar.gz"
	"intx-${_intx_version}.tar.gz::https://github.com/chfast/intx/archive/v${_intx_version}.tar.gz"
	"blst-${_blst_version}.tar.gz::https://github.com/supranational/blst/archive/refs/tags/v${_blst_version}.tar.gz"
)
noextract=("blst-${_blst_version}.tar.gz")
sha256sums=(
	35b2899b2c170380034a1d1bb252af1093a2c6f77304f78f795739074125af0a
	7db5d37ae5e9c3787a12c27e53a28be840a35ee51101c3ac15412ce259191600
	e04805b7d6ef9e1d89b7f511a5b86136c57b455d97924d7324da2305a864673f
)

prepare()
{
	# blst source tarball must be placed in the build dir or the project's CMake will attempt to download it.
	mkdir --parents "build/deps/src/"
	ln --symbolic --force \
		"${startdir}/blst-${_blst_version}.tar.gz" \
		"build/deps/src/v${_blst_version}.tar.gz"
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

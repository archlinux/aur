# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>

pkgname=evmone
pkgver=0.15.0
pkgrel=1
_evmc_version=12.1.0
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ethereum/evmone/archive/refs/tags/v${pkgver}.tar.gz"
	"evmc-${_evmc_version}.tar.gz::https://github.com/ethereum/evmc/archive/refs/tags/v${_evmc_version}.tar.gz"
)
sha256sums=(
	6eb2122c98bd86a083015b4e41f46b16df4d9bff608d2bf2f2d985ec18e6d640
	0d5458015bf38a5358fad04cc290d21ec40122d1eb6420e0b33ae25546984bcd
)

prepare()
{
	# The repo has submodules, but in the source package they're just empty dirs.
	# NOTE: Ignoring the test/evm-benchmarks submodule. We're not going to run benchmarks here.
	cd "${pkgname}-${pkgver}/"
	rmdir evmc/
	ln --symbolic "../evmc-${_evmc_version}/" evmc
	touch evmc/.git
}

build ()
{
	cmake \
		-B "build/" \
		-S "${pkgname}-${pkgver}/" \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=None \
		-D BUILD_SHARED_LIBS=ON \
		-D EVMONE_TESTING=OFF \
		-D EVMONE_FUZZING=OFF \
		-D EVMC_INSTALL=OFF \
		-D CMAKE_INSTALL_PREFIX=/usr/
	cmake --build build/
}

package ()
{
	DESTDIR="${pkgdir}/" \
		cmake --install build/

	cd "${pkgname}-${pkgver}/"
	install -D --mode 644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -r docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
}

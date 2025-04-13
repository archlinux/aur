# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>

pkgname=evmone
pkgver=0.15.0
pkgrel=1
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake git)
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://github.com/ethereum/evmc.git"
	"git+https://github.com/ipsilon/evm-benchmarks.git"
)
sha256sums=(
	7163a095caa44022ab784a5aea9dc8500401441ef49a733b912b29d2a67b8370
	SKIP
	SKIP
)

prepare()
{
	cd "${pkgname}/"
	git config submodule.evmc.url           ../evmc/
	git config submodule.evm-benchmarks.url ../evm-benchmarks/
	git \
		-c protocol.file.allow=always \
		submodule update --init
}

build ()
{
	cmake \
		-B "build/" \
		-S "${pkgname}/" \
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
}

# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-generic-nightly
pkgver=20221215_nextpnr_0.4_63_g16ffd02a
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - generic"
arch=("x86_64")
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")
groups=()
options=("!strip")
depends=(
	"yosys-nightly"
	"python"
	"boost-libs"
	"qt5-base"
)
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "gawk" "eigen" "boost")
conflicts=(
	"nextpnr-git"
	"nextpnr-all-nightly"
)
replaces=()
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git#commit=16ffd02a"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	[ ! -d "${srcdir}/nextpnr/build-generic" ] && mkdir build-generic
}

build() {
	cd "${srcdir}/nextpnr"
	cd build-generic
		cmake -G Ninja        \
			-DARCH=generic    \
			-DBUILD_PYTHON=ON \
			-DBUILD_GUI=ON    \
			-DCMAKE_BUILD_TYPE=RelWithDebInfo \
			-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
			-DUSE_OPENMP=ON	\
			..
	ninja
}

package() {
	cd "${srcdir}/nextpnr"
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-generic install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr-generic/COPYING"
}

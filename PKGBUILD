# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-nexus-nightly
pkgver=20230424_nextpnr_0.5_110_g051bdb12
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - for nexus"
arch=("x86_64")
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")
groups=()
options=("!strip")
depends=(
	"yosys-nightly"
	"prjoxide-nightly"
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
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git#commit=051bdb12"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	[ ! -d "${srcdir}/nextpnr/build-nexus" ] && mkdir build-nexus
}

build() {
	cd "${srcdir}/nextpnr"
	cd build-nexus
		cmake -G Ninja        \
			-DARCH=nexus      \
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
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-nexus install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr-nexus/COPYING"
}

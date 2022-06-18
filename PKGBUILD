# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-all-nightly
pkgver=20220618_nextpnr_0.3_37_g8d063d38
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - all FPGA architectures"
arch=("x86_64")
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")
groups=()
options=("!strip")
depends=(
	"yosys-nightly"
	"prjtrellis-nightly"
	"icestorm-nightly"
	"prjoxide-nightly"
	"python"
	"boost-libs"
	"qt5-base"
)
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "gawk" "eigen" "boost")
conflicts=(
	"nextpnr-git"
	"nextpnr-ice40-nightly"
	"nextpnr-ecp5-nightly"
	"nextpnr-nexus-nightly"
	"nextpnr-generic-nightly"
)
replaces=()
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git#commit=8d063d38"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	[ ! -d "${srcdir}/nextpnr/build-all" ] && mkdir build-all
}

build() {
	cd "${srcdir}/nextpnr"
	cd build-all
		cmake -G Ninja        \
			-DARCH=generic,ice40,ecp5,nexus \
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
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-ecp5 install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr/COPYING"
}

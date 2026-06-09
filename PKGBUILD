# Maintainer: Benjamin Stürz <benni@stuerz.xyz>

pkgname=nextpnr
pkgver=0.10
pkgrel=1
pkgdesc="nextpnr portable FPGA place and route tool - ice40, ecp5, machxo2, nexus, and generic"
arch=("x86_64")
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")
groups=()
options=("!strip")
depends=(
	"python"
	"boost-libs"
	"qt5-base"
	"yosys"
	"prjtrellis"
	"prjtrellis-db-git" # prjtrellis-db is way too old
	# TODO: package non -nightly versions:
	"icestorm-nightly" 
	"prjoxide-nightly"
)
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "gawk" "eigen" "boost")
conflicts=(
	"nextpnr-git"
	"nextpnr-ecp5-nightly"
	"nextpnr-ice40-nightly"
	"nextpnr-nexus-nightly"
	"nextpnr-generic-nightly"
)
replaces=()
provides=(
	"nextpnr-ecp5=${pkgver}"
	"nextpnr-ice40=${pkgver}"
	"nextpnr-nexus=${pkgver}"
	"nextpnr-generic=${pkgver}"
)
source=(
	"https://github.com/YosysHQ/nextpnr/archive/refs/tags/nextpnr-${pkgver}.tar.gz"
)
sha256sums=('374393094cdf7b2aae415cebf0994840b4a355bb95e89c683ef19f95f0b14dc2')

prepare() {
	cd "${srcdir}/nextpnr-nextpnr-${pkgver}"
	git submodule update --init
}

build() {
	mkdir -p "${srcdir}/nextpnr-nextpnr-${pkgver}/build"
	cd "${srcdir}/nextpnr-nextpnr-${pkgver}/build"
	cmake -G Ninja        \
		-DARCH='generic;ice40;ecp5;nexus'      \
		-DBUILD_PYTHON=ON \
		-DBUILD_GUI=ON    \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_OPENMP=ON	\
		..
	ninja
}

package() {
	cd "${srcdir}/nextpnr-nextpnr-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C build install

	install -Dm644 "${srcdir}/nextpnr-nextpnr-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/nextpnr/COPYING"
}

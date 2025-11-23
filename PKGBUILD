# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-all-nightly
pkgver=20251123_nextpnr_0.9_41_g900573c7
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - ice40, ecp5, machxo2, nexus, and generic"
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
	"nextpnr-machxo2-nightly"
	"nextpnr-nexus-nightly"
	"nextpnr-generic-nightly"
)
replaces=()
provides=(
	"nextpnr-ecp5=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-generic=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-ice40=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-machxo2=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-nexus=$(cut -d _ -f 3 <<< "${pkgver}")"
)
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git#commit=900573c7"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	git submodule update --init
	[ ! -d "${srcdir}/nextpnr/build-ice40" ] && mkdir build-ice40
	[ ! -d "${srcdir}/nextpnr/build-ecp5" ] && mkdir build-ecp5
	[ ! -d "${srcdir}/nextpnr/build-machxo2" ] && mkdir build-machxo2
	[ ! -d "${srcdir}/nextpnr/build-nexus" ] && mkdir build-nexus
	[ ! -d "${srcdir}/nextpnr/build-generic" ] && mkdir build-generic
}

build() {
	cd "${srcdir}/nextpnr/build-ice40"
	cmake -G Ninja        \
		-DARCH=ice40      \
		-DBUILD_PYTHON=ON \
		-DBUILD_GUI=ON    \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
		-DUSE_OPENMP=ON	\
		..
	ninja

	cd "${srcdir}/nextpnr/build-ecp5"
	cmake -G Ninja        \
		-DARCH=ecp5       \
		-DBUILD_PYTHON=ON \
		-DBUILD_GUI=ON    \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
		-DUSE_OPENMP=ON	\
		..
	ninja

	cd "${srcdir}/nextpnr/build-machxo2"
	cmake -G Ninja        \
		-DARCH=machxo2     \
		-DBUILD_PYTHON=ON \
		-DBUILD_GUI=ON    \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
		-DUSE_OPENMP=ON	\
		..
	ninja

	cd "${srcdir}/nextpnr/build-nexus"
	cmake -G Ninja        \
		-DARCH=nexus      \
		-DBUILD_PYTHON=ON \
		-DBUILD_GUI=ON    \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
		-DUSE_OPENMP=ON	\
		..
	ninja


	cd "${srcdir}/nextpnr/build-generic"
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

	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-ice40 install
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-ecp5 install
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-machxo2 install
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-nexus install
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-generic install

	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr/COPYING"
}

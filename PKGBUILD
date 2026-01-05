# Maintainer: viniciuskant <vinicius070204@gmail.com>

# This PKGBUILD is adapted from the original by Aki-nyan <aur@catgirl.link>
# It has been modified to automatically fetch the latest tag from the repository.
# Original maintainer credits remain with Aki-nyan.

pkgname=nextpnr-all-nightly-tag
pkgver=20260105_nextpnr_0.9_49_g7bd1336f
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
	"nextpnr-all-nightly"
	"nextpnr-git"
	"nextpnr-ice40-nightly"
	"nextpnr-ecp5-nightly"
	"nextpnr-machxo2-nightly"
	"nextpnr-nexus-nightly"
	"nextpnr-generic-nightly"
)
replaces=()
provides=(
	"nextpnr-all-nightly"
	"nextpnr-ecp5=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-generic=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-ice40=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-machxo2=$(cut -d _ -f 3 <<< "${pkgver}")"
	"nextpnr-nexus=$(cut -d _ -f 3 <<< "${pkgver}")"
)
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"

_get_latest_tag() {
	git -C "${srcdir}/nextpnr" describe --tags --abbrev=0 2>/dev/null || echo "nextpnr-0.0"
}

_get_current_commit() {
	git -C "${srcdir}/nextpnr" rev-parse --short HEAD
}

_get_commits_since_tag() {
	git -C "${srcdir}/nextpnr" describe --tags --long | cut -d- -f2
}

pkgver() {
	cd "${srcdir}/nextpnr"
	
	git fetch --tags
	
	local latest_tag=$(_get_latest_tag)
	local commit_hash=$(_get_current_commit)
	local commits_since=$(_get_commits_since_tag)
	local date=$(date +%Y%m%d)
	
	latest_tag=${latest_tag#nextpnr-}
	
	echo "${date}_nextpnr_${latest_tag}_${commits_since}_g${commit_hash}"
}

prepare() {
	cd "${srcdir}/nextpnr"
	
	git checkout tags/$(_get_latest_tag) 2>/dev/null || git checkout master
	
	git submodule update --init --recursive
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
# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-machxo2-nightly
pkgver=20251102_nextpnr_0.9_38_g30669eca
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - for machxo2"
arch=("x86_64")
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")
groups=()
options=("!strip")
depends=(
	"yosys-nightly"
	"prjtrellis-nightly"
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
provides=("nextpnr-machxo2=$(cut -d _ -f 3 <<< "${pkgver}")")
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git#commit=30669eca"
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	git submodule update --init
	[ ! -d "${srcdir}/nextpnr/build-machxo2" ] && mkdir build-machxo2
}

build() {
	cd "${srcdir}/nextpnr"
	cd build-machxo2
		cmake -G Ninja        \
			-DARCH=machxo2    \
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
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-machxo2 install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr-machxo2/COPYING"
}

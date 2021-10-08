# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-nexus-nightly
pkgver=b749ef5f_20211008
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - for nexus"
arch=("any")
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
)
replaces=()
source=(
	"nextpnr::git+https://github.com/YosysHQ/nextpnr.git"#commit=b749ef5f
)
sha256sums=(
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	[ ! -d "${srcdir}/nextpnr/build-nexus" ] && mkdir build-nexus
	cd ..
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
	cd ..
	ninja -C build-nexus
	cd ..
}

package() {
	cd "${srcdir}/nextpnr"
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-nexus install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/nextpnr-nexus/COPYING"
	cd ..
}

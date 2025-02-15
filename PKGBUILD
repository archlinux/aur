# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Aki-nyan <aur@catgirl.link>

_pkgname=nextpnr-himbaechel
pkgname=$_pkgname-git
pkgver=r4836.f3a5024d
pkgrel=1
pkgdesc="nextpnr portable FPGA place and route tool - Himbaechel backend for Xilinx"
arch=(x86_64)
url="https://github.com/YosysHQ/nextpnr"
license=("custom:ISC")

depends=("python" "boost-libs")
makedepends=("git" "gcc" "cmake" "pkgconf" "gawk" "eigen" "boost" "prjxray-db>=r258" "pypy3")
conflicts=("nextpnr")

source=(
	"$_pkgname::git+$url"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/$_pkgname"
	git submodule update --remote --init himbaechel/uarch/xilinx/meta
	#git submodule update --remote --init tests
	sed -i -E 's|(add_subdirectory\(tests/gui\))|#\1|' CMakeLists.txt
}

build() {

	cmake -S "$_pkgname" -B build \
		-DARCH=himbaechel \
		-DHIMBAECHEL_UARCH=xilinx \
		-DHIMBAECHEL_XILINX_DEVICES="xc7z010;xc7z020" \
		-DHIMBAECHEL_PRJXRAY_DB="/usr/share/xray/database" \
		-DBUILD_PYTHON=OFF \
		-DBUILD_GUI=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_OPENMP=ON

	make -C build

}

package() {
	make -C build DESTDIR="${pkgdir}" install

	install -Dm644 "$_pkgname/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"

}


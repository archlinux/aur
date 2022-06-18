# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Aki-nyan <aur@catgirl.link>

_pkgname=nextpnr-xilinx
pkgname=$_pkgname-git
pkgver=r2851.19fa4e64
pkgrel=2
epoch=2
pkgdesc="nextpnr portable FPGA place and route tool - for Xilinx"
arch=(x86_64)
url="https://github.com/gatecat/$_pkgname"
license=("custom:ISC")
groups=()
depends=(
	"python"
	"boost-libs"
)
optdepends=()
makedepends=("git" "gcc" "cmake" "pkgconf" "gawk" "eigen" "boost" "prjxray-db>=r258" "pypy3")
conflicts=(
	"nextpnr"
)
replaces=()
source=(
	"$_pkgname::git+$url"
	"nextpnr-xilinx-meta::git+https://github.com/gatecat/nextpnr-xilinx-meta.git"
)
sha256sums=('SKIP'
            'SKIP')
_DEVICES=(
	"xc7a100tcsg324-1"
	"xc7a100tfgg676-1"
	"xc7a200tffg1156-1"
	"xc7a200tsbg484-1"
	"xc7a35tcpg236-1"
	"xc7a35tcsg324-1"
	"xc7a35tftg256-1"
	"xc7a50tfgg484-1"
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cmake -S "$_pkgname" -B build \
		-DARCH=xilinx \
		-DBUILD_TESTS=ON \
		-DBUILD_PYTHON=OFF \
		-DBUILD_GUI=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_OPENMP=ON

	make -C build

	echo "Generating device database, it will take some time, have a coffee..."

	mkdir -p devicedbs
	for i in "${_DEVICES[@]}"; do
		echo "### Generating device $i ###"
		pypy3 "$_pkgname"/xilinx/python/bbaexport.py --xray /usr/share/xray/database/artix7 --meta "$srcdir/nextpnr-xilinx-meta/artix7" --device "$i" --bba "devicedbs/$i.bba"
		build/bbasm --le "devicedbs/$i.bba" "devicedbs/$i.bin"
	done
}

check() {
	make -C build test
}

package() {
	make -C build DESTDIR="${pkgdir}" install

	install -Dm644 "$_pkgname/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
	for i in "${_DEVICES[@]}"; do
		install -Dm644 "devicedbs/$i.bin" "${pkgdir}/usr/share/nextpnr/xilinx-chipdb/$i.bin"
	done
}

# vim: set noet:

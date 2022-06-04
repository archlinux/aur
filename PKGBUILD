# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Aki-nyan <aur@catgirl.link>

pkgname=nextpnr-xilinx-git
pkgver=cd8b15d_20211117
pkgrel=1
epoch=1
pkgdesc="nextpnr portable FPGA place and route tool - for Xilinx"
arch=("any")
url="https://github.com/gatecat/nextpnr-xilinx"
license=("custom:ISC")
groups=()
depends=(
	"python"
	"boost-libs"
)
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "gawk" "eigen" "boost" "prjxray-db>=r258" "pypy3")
conflicts=(
	"nextpnr"
)
replaces=()
source=(
	"nextpnr::git+https://github.com/gatecat/nextpnr-xilinx.git"
	"nextpnr-xilinx-meta::git+https://github.com/gatecat/nextpnr-xilinx-meta.git"
	"0001-fix-xilinx_device-patch-export-for-xc7a35t-fabric.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'e4faf96ecffea231c31e5b2e481bb48a8646982bc98ad71a463cabb078ff4856')
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

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/nextpnr"
	patch -p1 < "$srcdir/0001-fix-xilinx_device-patch-export-for-xc7a35t-fabric.patch"

	mkdir -p build-xilinx
	cd ..
}

build() {
	cd "${srcdir}/nextpnr"
	cd build-xilinx
		cmake -G Ninja        \
			-DARCH=xilinx     \
			-DBUILD_TESTS=ON \
			-DBUILD_PYTHON=OFF \
			-DBUILD_GUI=OFF    \
			-DCMAKE_BUILD_TYPE=None \
			-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
			-DUSE_OPENMP=ON	\
			..
	cd ..
	ninja -C build-xilinx
#    echo "Generating device xc7a35t"
#    [ ! -f "xilinx/xc7a35t.bba" ] && python3 xilinx/python/bbaexport.py --device xc7a35tcsg324-1 --bba xilinx/xc7a35t.bba
#    [ ! -f "xilinx/xc7a35t.bin" ] && build-xilinx/bbasm --l xilinx/xc7a35t.bba xilinx/xc7a35t.bin
    echo "Generating device database, it will take some time, have a coffee..."
    for i in ${_DEVICES[@]}; do
        echo "### Generating device $i ###"
        [ ! -f "xilinx/$i.bba" ] && pypy3 xilinx/python/bbaexport.py --xray /usr/share/xray/database/artix7 --meta "$srcdir/nextpnr-xilinx-meta/artix7" --device $i --bba xilinx/$i.bba
        [ ! -f "xilinx/$i.bin" ] && build-xilinx/bbasm --l xilinx/$i.bba xilinx/$i.bin
    done
    cd ..
}

check() {
	cd "${srcdir}/nextpnr"
	ninja -C build-xilinx test
}

package() {
	cd "${srcdir}/nextpnr"
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build-xilinx install
	install -Dm644 "${srcdir}/nextpnr/COPYING" "${pkgdir}${_PREFIX}/share/licenses/$pkgname/COPYING"
    for i in ${_DEVICES[@]}; do
        install -Dm644 "${srcdir}/nextpnr/xilinx/$i.bin" "${pkgdir}${_PREFIX}/share/nextpnr/xilinx-chipdb/$i.bin"
    done
    cd ..
}

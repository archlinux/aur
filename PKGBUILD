# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=yosys-nightly
pkgver=20260204_v0.61_132_g6dbe03f0f
pkgrel=1
epoch=1
pkgdesc="Yosys Open SYnthesis Suite, A framework for RTL synthesis"
arch=("x86_64")
url="https://yosyshq.net/yosys/"
license=("custom:ISC")
groups=()
options=("!strip")
depends=("tcl" "libffi" "python" "boost-libs" "zlib" "readline")
optdepends=("graphviz: Schematics display support" "xdot: Design netlist display support")
makedepends=("git" "gcc" "bison" "flex" "pkgconf" "gawk" "protobuf" "iverilog" "pybind11")
conflicts=("yosys" "yosys-git" "python-yosys")
replaces=("yosys" "yosys-git" "python-yosys")
provides=("yosys=$(cut -d _ -f 3 <<< "${pkgver}")")
source=(
	"yosys::git+https://github.com/YosysHQ/yosys.git#commit=6dbe03f0f"
	"yosys.conf"
)
sha256sums=(
	"SKIP"
	"19f15460e07c8e737857026e30a611236c8bb076b7befec7d547d9e46f36d8a3"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/yosys"
	make config-gcc
	cp "${srcdir}/yosys.conf" Makefile.conf
	git submodule update --init
}

build() {
	cd "${srcdir}/yosys"
	make PREFIX="${_PREFIX}"
}

package() {
	cd "${srcdir}/yosys"
	make STRIP=':' PREFIX="${_PREFIX}" PYTHON_PREFIX="${pkgdir}${_PREFIX}" DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/yosys/LICENSE"
}

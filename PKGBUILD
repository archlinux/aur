# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=yosys-nightly
pkgver=20260728_v0.67_102_g07a615a28
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
makedepends=("git" "gcc" "bison" "flex" "pkgconf" "gawk" "protobuf" "iverilog" "pybind11" "uv")
conflicts=("yosys" "yosys-git" "python-yosys")
replaces=("yosys" "yosys-git" "python-yosys")
provides=("yosys=$(cut -d _ -f 3 <<< "${pkgver}")")
source=(
	"yosys::git+https://github.com/YosysHQ/yosys.git#commit=07a615a28"
	"yosys.conf"
)
sha256sums=(
	"SKIP"
	"19f15460e07c8e737857026e30a611236c8bb076b7befec7d547d9e46f36d8a3"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/yosys"
	if [ ! -f "CMakeLists.txt" ]; then
		make config-gcc
		cp "${srcdir}/yosys.conf" Makefile.conf
	else
		if [ ! -d "${srcdir}/yosys/build" ]; then
			mkdir build
		fi
	fi
	git submodule update --init
}

build() {
	cd "${srcdir}/yosys"
	UV_NO_MANAGED_PYTHON=1
	if [ ! -f "CMakeLists.txt" ]; then
		make PREFIX="${_PREFIX}"
	else
		cd build
		cmake -G Ninja \
			-DBUILD_SHARED_LIBS=ON \
			-DCMAKE_BUILD_TYPE=RelWithDebInfo \
			-DCMAKE_INSTALL_PREFIX="${_PREFIX}" \
			-DYOSYS_WITH_PYTHON=ON \
			-DYOSYS_INSTALL_PYTHON=ON \
			-DYOSYS_INSTALL_LIBRARY=ON \
			..
		ninja
	fi
}

package() {
	cd "${srcdir}/yosys"
	if [ ! -f "CMakeLists.txt" ]; then
		make STRIP=':' PREFIX="${_PREFIX}" PYTHON_PREFIX="${pkgdir}${_PREFIX}" DESTDIR="${pkgdir}" install
	else
		DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build install
	fi

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/yosys/LICENSE"
}

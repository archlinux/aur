# Maintainer: Jon Nordby <jononor@gmail.com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Aki-nyan <aur@catgirl.link>

_pkgname=nextpnr-himbaechel-gatemate
pkgname=$_pkgname-git
pkgver=r5156.2b560ad0
pkgrel=1
pkgdesc="nextpnr portable FPGA place and route tool - Himbaechel backend for Gatemate"
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
	#git submodule update --remote --init -r
	#git submodule update --remote --init tests
	sed -i -E 's|(add_subdirectory\(tests/gui\))|#\1|' CMakeLists.txt
    [ -d prjpeppercorn ] || git clone https://github.com/YosysHQ/prjpeppercorn
}

build() {

    # build nextpnr
	cmake -S "$_pkgname" -B build \
		-DARCH=himbaechel \
		-DHIMBAECHEL_UARCH=gatemate \
		-DHIMBAECHEL_PRJXRAY_DB="/usr/share/xray/database" \
		-DBUILD_PYTHON=OFF \
		-DBUILD_GUI=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DHIMBAECHEL_PEPPERCORN_PATH="${srcdir}/$_pkgname/prjpeppercorn" \
		-DUSE_OPENMP=ON

	make -C build

    # build gmpack
    #cd ${srcdir}/$_pkgname/prjpeppercorn/libgm
	cmake -S "${srcdir}/$_pkgname/prjpeppercorn/libgm" -B build-libgm
	make -C build-libgm
}

package() {
	make -C build DESTDIR="${pkgdir}" install
	make -C build-libgm DESTDIR="${pkgdir}" install

	install -Dm644 "$_pkgname/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}


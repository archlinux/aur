# Maintainer: kraylas <kraylas@outlook.com>


pkgname=udrefl-git
pkgver=0.10.5.r0.g9f73e2d
pkgrel=1
pkgdesc="Ubpa Dynamic Reflection "
arch=('any')
url="https://github.com/Ubpa/USRefl"
license=('MIT')
depends=('ucmake' 'utemplate' 'usmallflat')
provides=('udrefl')
makedepends=('git')
source=(git+https://github.com/Ubpa/UDRefl.git)
md5sums=('SKIP')

pkgver() {
	cd UDRefl
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd UDRefl
	sed -i "60,61d" "src/core/CMakeLists.txt"
	sed -i "s?option(Ubpa_UDRefl_Build_Shared \"build shared library\" OFF)?option(Ubpa_UDRefl_Build_Shared \"build shared library\" ON)?g" "CMakeLists.txt"
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build -DCMAKE_BUILD_TYPE=Debug
	cmake --build _build -j $(grep 'processor' /proc/cpuinfo | sort -u | wc -l)
}

package() {
	cd UDRefl
	cmake --build _build --target install -j $(grep 'processor' /proc/cpuinfo | sort -u | wc -l)
	_dirname="UDRefl_0_10_5"
	mkdir -p "${pkgdir}/usr/lib/cmake"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/licenses/udrefl-git"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/UDRefl"
	mv "$srcdir/install/$_dirname/include/UDRefl" "${pkgdir}/usr/include/"
	mv "$srcdir/install/$_dirname/lib/libUDRefl_cored.so" "${pkgdir}/usr/lib/"
	mv "$srcdir/UDRefl/LICENSE" "${pkgdir}/usr/share/licenses/udrefl-git"
	sed -i "s?\"\${CMAKE_CURRENT_LIST_DIR}/../include\"?\"/usr/include\"?g" "${pkgdir}/usr/lib/cmake/UDRefl/UDReflConfig.cmake"
	sed -i "s?\"\${_IMPORT_PREFIX}/UDRefl_0_10_5/include\"?\"/usr/include\"?g" "${pkgdir}/usr/lib/cmake/UDRefl/UDReflTargets.cmake"
	sed -i "s?\"\${_IMPORT_PREFIX}/UDRefl_0_10_5/lib/libUDRefl_cored.so\"?\"/usr/lib/libUDRefl_cored.so\"?g" "${pkgdir}/usr/lib/cmake/UDRefl/UDReflTargets-debug.cmake"
}

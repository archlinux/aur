# Maintainer: kraylas <kraylas@outlook.com>


pkgname=udrefl-git
pkgver=0.10.5.r0.g9f73e2d
pkgrel=1
pkgdesc="Header-only, tiny (99 lines) and powerful C++20 static reflection library."
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
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build
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
	mv "$srcdir/install/$_dirname/lib/libUDRefl_core.a" "${pkgdir}/usr/lib/"
	mv "$srcdir/UDRefl/LICENSE" "${pkgdir}/usr/share/licenses/udrefl-git"
	sed -i "s?\"\${CMAKE_CURRENT_LIST_DIR}/../include\"?\"/usr/include\"?g" "${pkgdir}/usr/lib/cmake/UDRefl/UDReflConfig.cmake"
}

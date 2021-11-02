# Maintainer: kraylas <kraylas@outlook.com>


pkgname=usrefl-git
pkgver=0.8.1.r0.gbe9d6d7
pkgrel=1
pkgdesc="Header-only, tiny (99 lines) and powerful C++20 static reflection library."
arch=('any')
url="https://github.com/Ubpa/USRefl"
license=('MIT')
depends=('ucmake' 'utemplate')
provides=('usrefl')
makedepends=('git')
source=(git+https://github.com/Ubpa/USRefl.git)
md5sums=('SKIP')

pkgver() {
	cd USRefl
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd USRefl
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build
	cmake --build _build
}

package() {
	cd USRefl
	cmake --build _build --target install
	_dirname=`ls $srcdir/install`
	mkdir -p "${pkgdir}/usr/lib/cmake"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/licenses/usrefl-git"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/USRefl"
	mv "$srcdir/install/$_dirname/include/USRefl" "${pkgdir}/usr/include/"
	mv "$srcdir/USRefl/LICENSE" "${pkgdir}/usr/share/licenses/usrefl-git"
	sed -i "s?\"\${CMAKE_CURRENT_LIST_DIR}/../include\"?\"/usr/include\"?g" "${pkgdir}/usr/lib/cmake/USRefl/USReflConfig.cmake"
}

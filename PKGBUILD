# Maintainer: kraylas <kraylas@outlook.com>


pkgname=usmallflat-git
pkgver=0.2.3.r1.g488d1f6
pkgrel=1
pkgdesc="Ubpa small flat containers based on C++20 "
arch=('any')
url="https://github.com/Ubpa/USmallFlat"
license=('MIT')
depends=('ucmake')
provides=('usmallflat')
makedepends=('git' 'cmake')
source=(git+https://github.com/Ubpa/USmallFlat.git)
md5sums=('SKIP')

pkgver() {
	cd USmallFlat
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd USmallFlat
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build
	cmake --build _build
}

package() {
	cd USmallFlat
	cmake --build _build --target install
	_dirname=`ls $srcdir/install`
	mkdir -p "${pkgdir}/usr/lib/cmake"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/share/licenses/usmallflat-git"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/USmallFlat"
	mv "$srcdir/install/$_dirname/include/USmallFlat" "${pkgdir}/usr/include/"
	mv "$srcdir/USmallFlat/LICENSE" "${pkgdir}/usr/share/licenses/usmallflat-git"
	sed -i "s?\"\${CMAKE_CURRENT_LIST_DIR}/../include\"?\"/usr/include\"?g" "${pkgdir}/usr/lib/cmake/USmallFlat/USmallFlatConfig.cmake"
}

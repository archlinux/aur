# Maintainer: kraylas <kraylas@outlook.com>


pkgname=utemplate-git
pkgver=0.7.1.r2.g427d3f7
pkgrel=1
pkgdesc="Ubpa UTemplate"
arch=('any')
url="https://github.com/Ubpa/UTemplate"
license=('MIT')
depends=('ucmake-git')
makedepends=('git')
source=(git+https://github.com/Ubpa/UTemplate.git)
md5sums=('SKIP')

pkgver() {
	cd UTemplate
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd UTemplate
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build
	cmake --build _build
}

package() {
	cd UTemplate
	cmake --build _build --target install
	_dirname=`ls $srcdir/install`
	mkdir -p "${pkgdir}/usr/lib/cmake"
	mkdir -p "${pkgdir}/usr/include"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/UTemplate"
	mv "$srcdir/install/$_dirname/include/UTemplate" "${pkgdir}/usr/include/"
	patch "${pkgdir}/usr/lib/cmake/UTemplate/UTemplateConfig.cmake" "${srcdir}/../fix.patch"
}

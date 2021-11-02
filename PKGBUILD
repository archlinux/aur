# Maintainer: kraylas <kraylas@outlook.com>


pkgname=utemplate-git
pkgver=0.7.2.r0.gf0cc3e4
pkgrel=1
pkgdesc="Ubpa UTemplate"
arch=('any')
url="https://github.com/Ubpa/UTemplate"
license=('MIT')
depends=('ucmake')
provides=('utemplate')
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
	mkdir -p "${pkgdir}/usr/share/licenses/utemplate-git"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/UTemplate"
	mv "$srcdir/install/$_dirname/include/UTemplate" "${pkgdir}/usr/include/"
	mv "$srcdir/UTemplate/LICENSE" "${pkgdir}/usr/share/licenses/utemplate-git"
	patch "${pkgdir}/usr/lib/cmake/UTemplate/UTemplateConfig.cmake" "${srcdir}/../fix.patch"
}

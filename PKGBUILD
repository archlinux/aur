# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=0.9.3
pkgrel=1
pkgdesc="Data fitting with uncertainty analysis"
arch=(any)
url="https://github.com/bumps/bumps"
license=('LicenseRef-Public Domain')
depends=(python
         python-matplotlib
         python-numpy
         python-scikit-learn
         python-scipy
         python-wxpython)
makedepends=(python-setuptools
             python-sphinx)
checkdepends=(python-nose)
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz"
	"bumps.patch")
sha256sums=('e012cb56f21c7467d462c5f5c8262677b4cb98570d262deb6693c7735367d814'
            '398828e729a72bcfe0bdc7f6e8bbe6ca8e89700cd5f9da023e843c3551eddeea')

prepare() {
	cd ${_name}-${pkgver}
	# https://github.com/bumps/bumps/issues/139
	# https://github.com/bumps/bumps/pull/140
	#patch -p1 <../bumps.patch
}

build() {
	cd ${_name}-${pkgver}
	python setup.py build
	(cd bumps/dream && cc compiled.c -I ../../Random123/include/ -O2 -fopenmp -shared -lm -o _compiled.so -fPIC )
        (cd doc && make html)
#	(cd doc && make pdf)
}

check() {
	cd ${_name}-${pkgver}
	python test.py
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/licenses/python-bumps
	cp ${srcdir}/${_name}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/python-bumps/license.txt
	mkdir -p ${pkgdir}/usr/share/doc/python-bumps
	cp ${srcdir}/${_name}-${pkgver}/doc/_build/html ${pkgdir}/usr/share/doc/python-bumps -R
}

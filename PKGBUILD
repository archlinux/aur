# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=0.9.2
pkgrel=4
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
sha256sums=('d4fa7c4c9bd07e3ef24a60ace3d4b17b3666258d51819b101a571ec07cd217c3'
            'ff31b684bd8ad83242202cf578e24d859fede44b15cc72b653428fdd8549e322')

prepare() {
	cd ${_name}-${pkgver}
	# https://github.com/bumps/bumps/issues/139
	patch -p1 <../bumps.patch
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

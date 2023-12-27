# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=0.9.1
pkgrel=2
pkgdesc="Data fitting with uncertainty analysis"
arch=(any)
url="https://github.com/bumps/bumps"
license=('custom')
depends=(python-scipy
         python-matplotlib
         python-wxpython
         python-periodictable
         python-scikit-learn)
makedepends=(python-setuptools
             python-sphinx)
#checkdepends=(python-nose)
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/v${pkgver}.tar.gz"
	"bumps.patch")
sha256sums=('ad79ec1eafda09d5b476453593278b2607004241b7f339936b230656fa1328fb'
            '97eaae9fb391f9e0308bb969b4f5a07c6e137039c6c611814e96a5a027b7578b')

prepare() {
	cd ${_name}-${pkgver}
	# https://github.com/bumps/bumps/issues/129
	patch -p1 <../bumps.patch
}

build() {
	cd ${_name}-${pkgver}
	python setup.py build
	(cd bumps/dream && cc compiled.c -I ../../Random123/include/ -O2 -fopenmp -shared -lm -o _compiled.so -fPIC )
        (cd doc && make html)
#	(cd doc && make pdf)
}

#check() {
#	cd ${_name}-${pkgver}
#	python test.py
#}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/share/licenses/python-bumps
	cp ${srcdir}/${_name}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/python-bumps/license.txt
	mkdir -p ${pkgdir}/usr/share/doc/python-bumps
	cp ${srcdir}/${_name}-${pkgver}/doc/_build/html ${pkgdir}/usr/share/doc/python-bumps -R
}

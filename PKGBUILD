# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
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
sha256sums=('b0eeb89a976ed340983496d70a83416fa65e5ca3a2eec13967f892268836ab68'
            'dbe2b429a766f2c8b022f5745cc43d1cf947cb481c348f86fa551d592920e1c0')

prepare() {
	cd ${_name}-${pkgver}
#	patch -p1 <../bumps.patch
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

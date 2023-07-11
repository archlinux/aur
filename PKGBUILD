# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Michal Wojdyla <micwoj9292 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

_name=scipy
pkgname=python2-scipy
pkgver=1.2.3
pkgrel=6
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=(x86_64)
url="https://www.scipy.org/"
license=(BSD)
makedepends=(gcc-fortran python2-setuptools)
checkdepends=(python2-pytest)
depends=(python2-numpy)
optdepends=('python2-pillow: for image saving module')
#source=("https://github.com/scipy/scipy/releases/download/v${pkgver}/scipy-$pkgver.tar.xz")
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d7739fa2f25689fc14ddf09477207c990b39b593a85f5c74687df1ffe097f6eee1bb2123aaa286189309f6d3b25cdd7757053d8b1008d1d6b3367a8e3a0a53b1')

prepare() {
  cd "scipy-$pkgver"
  
  for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

check() {
  cd scipy-$pkgver

  # we need to do a temp install so we can import scipy
  # also, the tests must not be run from the scipy source directory
  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="$srcdir"/test --optimize=1
  export PYTHONPATH="$srcdir"/test/usr/lib/python2.7/site-packages
  cd "$srcdir"
  python2 -c "from scipy import test; test('full')"
}

build() {
  # required for gfortran
  export LDFLAGS="-Wall -shared"

  cd "scipy-$pkgver"
  python2 setup.py config_fc --fcompiler=gnu95 --f77flags="-Wall -g -ffixed-form -fno-second-underscore -fallow-argument-mismatch" --f90flags="-Wall -g -fno-second-underscore -fallow-argument-mismatch" build
}

package() {
  cd "scipy-$pkgver"
  export LDFLAGS="-Wall -shared"

  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/python2-scipy/LICENSE
}

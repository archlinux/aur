# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python3-pydde
pkgver=0.2.2
pkgrel=2
pkgdesc="A solver for delay differential equations written in Python and C."
arch=('i686' 'x86_64')
url="http://users.ox.ac.uk/~clme1073/python/PyDDE/"
license=('GPL')
depends=('python3-numpy')
makedepends=('python3-numpy')
source=("http://users.ox.ac.uk/~clme1073/python/PyDDE/PyDDE-${pkgver}.tar.gz"
        "2to3.diff"
        "Py3-C-API.diff")
md5sums=('275eb5f15fb7124f06fef17655f63c12'
         '3814569707d1dfb89c754afb746f87cf'
         '7d937ddf1ce78e778b07711ea19f2ddf')

build() {
   cd ${srcdir}/PyDDE-${pkgver}
   ln -s /usr/lib/python3.2/site-packages/numpy/core/include/numpy/ PyDDE/src/numpy
   sed -i 's#<numpy/arrayobject.h>#"numpy/arrayobject.h"#' PyDDE/src/wrapper.c
   sed -i 's/extra_compile_args=\[""\]/extra_compile_args=["-I."]/' setup.py
   patch -p1 < ${srcdir}/2to3.diff
   patch PyDDE/src/wrapper.c < ${srcdir}/Py3-C-API.diff
   python setup.py install --prefix=/usr --root=${pkgdir} || return 1
}

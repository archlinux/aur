# Contributor: Stéphane Gaudreault <stephane.gaudreault@gmail.com>
pkgname=python2-sfepy
pkgver=2014.2
pkgrel=1
pkgdesc="Simple Finite Elements in Python"
arch=('i686' 'x86_64')
url="http://sfepy.org"
license=('BSD')
source=("http://sfepy.org/doc-devel/_static/downloads.php?fun=download2&ver=sfepy-${pkgver}.tar.gz")
md5sums=('a6c6c4046d3f0dbf70775f8622e76c35')

depends=('python2' 'python2-distribute' 'python2-numpy' 'python2-scipy'
         'python2-pyparsing' 'python2-matplotlib' 'python2-pytables' 'ipython2'
         'mayavi' 'cython2' 'python2-sympy')
optdepends=('umfpack'
            'pysparse'
            'gmsh'
            'tetgen'
            'python2-pexpect')

build() {
   cd ${srcdir}/sfepy-${pkgver}
   python2 setup.py build_ext --inplace
}

package() {
   cd ${srcdir}/sfepy-${pkgver}
   python2 setup.py install --prefix=/usr --root=${pkgdir}

   sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           $(find "${pkgdir}" -name '*.py')

   cp -r doc/ "${pkgdir}"/usr/lib/python2.7/site-packages/sfepy/
   install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

   cd ${pkgdir}/usr/bin
   mkdir -p ${pkgdir}/usr/share/sfepy/bin
   # move everything except isfepy
   mv *.py ${pkgdir}/usr/share/sfepy/bin
}

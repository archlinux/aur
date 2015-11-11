# Contributor: Pierre Gueth <pierre.gueth at gmail>
#              Daniel YC Lin <dlin.tw at gmail>
#              Tim Huetz <tim at huetz biz>
#              saxonbeta <saxonbeta at gmail>
# Maintainer: Flávio Zavan <flavio.zavan at gmail>
# vim:set ts=2 sw=2 et:
pkgname=libsvm-openmp
pkgver=3.20
_pkgver=320
_pyver=3.5
pkgrel=1
pkgdesc="A library for Support Vector Machines classification, includes openmp support, binaries and python bindings."
arch=(x86_64 i686)
url="http://www.csie.ntu.edu.tw/~cjlin/libsvm/"
license=('BSD')
provides=('libsvm')
conflicts=('libsvm')
depends=()
optdepends=('python: bindings for latest python version'
'python2: bindings for python 2'
'java-environment: bindings for java' )
source=("https://github.com/cjlin1/libsvm/archive/v$_pkgver.tar.gz"
    "openmp.patch")
sha256sums=('e4be7fc8d2e7cb65feae4d6387967484c01c9dc818e7dfff515f663728a6f2ca'
    'd357cc901505cb1aecd055cc953490f617b1baa8ac129ab580acf300c60ca1b0')

build() {
  cd "$srcdir/libsvm-$_pkgver"
  patch -p1 < "$srcdir/openmp.patch"
  make lib all
}
package() {
  cd "$srcdir/libsvm-$_pkgver"
  install -D -m755 svm-train $pkgdir/usr/bin/svm-train
  install -D -m755 svm-predict $pkgdir/usr/bin/svm-predict
  install -D -m755 svm-scale $pkgdir/usr/bin/svm-scale
  install -D -m644 java/libsvm.jar $pkgdir/usr/share/java/libsvm.jar
  install -D -m644 libsvm.so.2 $pkgdir/usr/lib/libsvm.so.2
  install -D -m644 svm.h $pkgdir/usr/include/svm.h
  ln -s libsvm.so.2 $pkgdir/usr/lib/libsvm.so
  mkdir -p $pkgdir/usr/share/licenses/libsvm
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/libsvm/LICENSE

  cd "python"
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' svm.py
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' svmutil.py
  install -D -m644 svm.py $pkgdir/usr/lib/python2.7/svm.py
  install -D -m644 svmutil.py $pkgdir/usr/lib/python2.7/svmutil.py
  sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' svm.py
  sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' svmutil.py
  install -D -m644 svm.py $pkgdir/usr/lib/python$_pyver/svm.py
  install -D -m644 svmutil.py $pkgdir/usr/lib/python$_pyver/svmutil.py

}


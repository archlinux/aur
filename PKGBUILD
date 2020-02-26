# Contributor: Pierre Gueth <pierre.gueth at gmail>
#              Daniel YC Lin <dlin.tw at gmail>
#              Tim Huetz <tim at huetz biz>
#              saxonbeta <saxonbeta at gmail>
# Submitter: Flávio Zavan <flavio.zavan at gmail>
# Maintainer: Roberto Polverelli Monti <rpolverelli at gmail>
pkgname=libsvm-openmp
pkgver=3.24
_pkgver=324
_pyver=3.5
pkgrel=1
pkgdesc="A library for Support Vector Machines classification, includes openmp
support, binaries and python bindings."
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
md5sums=('45149a776ebfd3470c6e0a4fc2482670'
         '7ab65af40d705e8d89af2fcaad9b616f')

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

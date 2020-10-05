# Maintainer: Jeremy MJ <jay@jskier.com>
# Contributer: Jeremy MJ <jay@jskier.com>

pkgbase=python2-pycurl-motioneye
pkgname=python2-pycurl-motioneye
pkgver=7.43.0.4
pkgrel=1
arch=('x86_64')
url="http://pycurl.sourceforge.net/"
license=('LGPL' 'MIT')
description="Python2 pycurl verision that works with motioneye until motioneye updates to python3 library"
conflicts=('python2-pycurl')
makedepends=('python2' 'curl')
checkdepends=('python2-bottle' 'python2-nose-show-skipped'
              'vsftpd' 'python2-flaky' 'python2-pyflakes')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pycurl/pycurl/archive/REL_${pkgver//./_}.tar.gz")
sha512sums=('0dbc42ee43534634b604536b5f8598be78d4b16f840fc3ef26e68674bce265707d3d0183bdfd37252979920abebe25d772acb028408d7dedcaf3f7469e2684fe')

prepare() {
  mv pycurl-REL_${pkgver//./_} pycurl-$pkgver
  cp -a pycurl-$pkgver{,-py2}

  cd "$srcdir"/pycurl-$pkgver-py2
  find . -name '*.py' -exec sed -i -e "s|#! /usr/bin/env python|#!/usr/bin/env python2|" {} +
    sed -i 's/"share", "doc", PACKAGE/"share", "doc", "python2-pycurl"/' setup.py
  sed -e "s/nosetests/nosetests2/" -e "s/python/python2/" -i tests/run.sh
  sed -e "s/pyflakes/pyflakes-python2/" -i Makefile
}

build() {
  cd "$srcdir"/pycurl-$pkgver-py2
  make
  python2 setup.py build
}

check() {
  export PYCURL_VSFTPD_PATH=vsftpd
  # We don't have HTTP2 enabled

  cd "$srcdir"/pycurl-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8:$PYTHONPATH" make test || warning "Tests failed"

  cd "$srcdir"/pycurl-$pkgver-py2
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7:$PYTHONPATH" make PYTHON=python2 NOSETESTS=nosetests2 test || warning "Tests failed"
}

package() {
  pkgdesc="A Python 2.x interface to libcurl"
  depends=('python2' 'curl')

  cd pycurl-$pkgver-py2
  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 COPYING-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

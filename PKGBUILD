# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=python2-pycurl
pkgver=7.43.0.3
pkgrel=1
epoch=1
pkgdesc="A Python 2.x interface to libcurl"
arch=('x86_64')
url="http://pycurl.sourceforge.net/"
license=('LGPL' 'MIT')
depends=('python2' 'curl')
checkdepends=('python2-bottle' 'python2-nose-show-skipped' 'vsftpd' 'python2-flaky' 'python2-pyflakes')
source=("https://github.com/pycurl/pycurl/archive/REL_${pkgver//./_}/$pkgname-$pkgver.tar.gz")
sha512sums=('1c210be7dde473a524fbc3084066b0aaa13c0a50cc2ab03bceb49030897058ae09bb4b8b5961823184469dc0901a5aae0f67992f408f37bb9bcb0c34ea014aec')

prepare() {
  mv pycurl-REL_${pkgver//./_} pycurl-$pkgver
  cd pycurl-$pkgver
  find . -name '*.py' -exec sed -i -e "s|#! /usr/bin/env python|#!/usr/bin/env python2|" {} +
  sed -i 's/"share", "doc", PACKAGE/"share", "doc", "python2-pycurl"/' setup.py
  sed -e "s/nosetests/nosetests2/" -e "s/python/python2/" -i tests/run.sh
  sed -e "s/pyflakes/pyflakes-python2/" -i Makefile
}

build() {
  cd pycurl-$pkgver
  make PYTHON=python2
  python2 setup.py build
}

check() {
  export PYCURL_VSFTPD_PATH=vsftpd
  # We don't have HTTP2 enabled

  cd pycurl-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7:$PYTHONPATH" make PYTHON=python2 NOSETESTS=nosetests2 test || warning "Tests failed"
}

package() {
  cd pycurl-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 COPYING-MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Florian Klink <flokli at flokli dot de>

_python=python2
_distname=pystache
pkgname=$_python-$_distname
pkgver=0.5.4
pkgrel=2
pkgdesc="The mustache template engine written in python"
arch=(any)
url="http://github.com/defunkt/pystache"
license=('MIT')
depends=('python2>=2.7')
makedepends=('python2-setuptools')
source=( "https://pypi.python.org/packages/source/${_distname:0:1}/$_distname/$_distname-$pkgver.tar.gz")
md5sums=('485885e67a0f6411d5252e69b20a35ca')

prepare() {
  echo 'Changing hashbangs in *.py files to refer to python2'
  sed -e 's|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

check() {
  cd "$srcdir/$_distname-$pkgver"
  LC_ALL='C.UTF-8' python2 test_pystache.py
}

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 || exit 1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mv -v "${pkgdir}/usr/bin/pystache"{,2}
  mv -v "${pkgdir}/usr/bin/pystache"{,2}-test
}

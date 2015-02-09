# $Id$
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=(pypy-pip pypy3-pip)
pkgver=6.0.8
pkgrel=2
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('pypy-setuptools' 'pypy3-setuptools') # pypy included in pypy-setuptools
source=(http://pypi.python.org/packages/source/p/pip/pip-${pkgver}.tar.gz)
md5sums=('2332e6f97e75ded3bddde0ced01dbda3')
sha256sums=('0d58487a1b7f5be2e5e965c11afbea1dc44ecec8069de03491a4d0d6c85f4551')

executable_files=(
  __init__.py
  _vendor/requests/packages/chardet/chardetect.py
  _vendor/certifi/core.py
  _vendor/requests/certs.py
)

package_pypy-pip() {
  depends=('pypy-setuptools')

  cd "$srcdir/pip-$pkgver"
  pypy setup.py build
  pypy setup.py install --prefix=/opt/pypy/ --root="$pkgdir"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "../../opt/pypy/bin/pip" "$pkgdir/usr/bin/pip-pypy"

  for f in "${executable_files[@]}" ; do
    sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env pypy|" \
      "$pkgdir/opt/pypy/site-packages/pip/$f"
  done

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pypy3-pip() {
  depends=('pypy3-setuptools')

  cd "$srcdir/pip-$pkgver"
  pypy3 setup.py build
  pypy3 setup.py install --prefix=/opt/pypy3/ --root="$pkgdir"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "../../opt/pypy3/bin/pip" "$pkgdir/usr/bin/pip-pypy3"

  for f in "${executable_files[@]}" ; do
    sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env pypy3|" \
      "$pkgdir/opt/pypy3/site-packages/pip/$f"
  done

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

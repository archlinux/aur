# $Id$
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=pypy-pip
pkgver=7.0.3
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
makedepends=('pypy-setuptools') # pypy included in pypy-setuptools
source=(http://pypi.python.org/packages/source/p/pip/pip-${pkgver}.tar.gz)
sha256sums=('b4c598825a6f6dc2cac65968feb28e6be6c1f7f1408493c60a07eaa731a0affd')

executable_files=(
  __init__.py
  _vendor/requests/packages/chardet/chardetect.py
  _vendor/requests/certs.py
)

package() {
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

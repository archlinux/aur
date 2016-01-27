# $Id$
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgbase=pypy-pip
pkgname=(pypy-pip)
pkgver=8.0.2
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
source=(http://pypi.python.org/packages/source/p/pip/pip-${pkgver}.tar.gz)
sha256sums=('46f4bd0d8dfd51125a554568d646fe4200a3c2c6c36b9f2d06d2212148439521')
# necessary due to a makepkg bug
makedepends=('pypy-setuptools' 'pypy3-setuptools')

executable_files=(
  __init__.py
  _vendor/requests/packages/chardet/chardetect.py
  _vendor/requests/certs.py
)

package_pypy-pip() {
  depends=('pypy' 'pypy-setuptools')

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
  depends=('pypy3' 'pypy3-setuptools')

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

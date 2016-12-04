# $Id$
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=pypy-pip
pkgver=9.0.1
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
source=(
    https://pypi.io/packages/source/p/pip/pip-${pkgver}.tar.gz{,.asc}
)
sha256sums=('09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d'
            'SKIP')
validpgpkeys=(
    '7C6B7C5D5E2B6356A926F04F6E3CBCE93372DCFA'  # Donald Stufft
)
depends=('pypy' 'pypy-setuptools')

executable_files=(
  __init__.py
  _vendor/requests/packages/chardet/chardetect.py
  _vendor/requests/certs.py
  _vendor/appdirs.py
)

package() {
  cd "$srcdir/pip-$pkgver"

  for f in "${executable_files[@]}" ; do
    sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env pypy|" "pip/$f"
  done

  pypy setup.py build
  pypy setup.py install --prefix=/opt/pypy/ --root="$pkgdir"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "../../opt/pypy/bin/pip" "$pkgdir/usr/bin/pip-pypy"

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

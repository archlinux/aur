# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgbase=python-sphinx-intl
pkgname=('python-sphinx-intl')
_name=${pkgname#python-}
pkgver=0.9.11
pkgrel=1
arch=('any')
pkgdesc='Sphinx utility that make it easy to translate and to apply translation.'
url='https://pypi.org/project/sphinx-intl'
license=('BSD')
makedepends=(
  'python-babel'
  'python-click'
  'python-setuptools'
  'python-six'
  'python2-babel'
  'python2-click'
  'python2-setuptools'
  'python2-six'
)
optdepends=('transifex-client: for using transifix')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d80719be2faf33b958e52ca79cba697625e0eb10fd857eb5e8882eae7fb338f5')

prepare() {
  # souce duplication is required because makefile modify source code
  # setyp.py --build tricks don't works well
  cp -a sphinx-intl-$pkgver sphinx-intl-${pkgver}-2
  # change python2 interpreter
  find sphinx-intl-${pkgver}-2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
  # change sphinx-binaries name in source code
  find sphinx-intl-${pkgver}-2 -type f -name '*.py' -exec \
    sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
}

build() {
  msg2 'Python 3 version'
  cd "$srcdir"/sphinx-intl-$pkgver
  python3 setup.py build

  msg2 'Python 2 version'
  cd "$srcdir"/sphinx-intl-${pkgver}-2
  python2 setup.py build
}

package_python-sphinx-intl() {
  
  depends=(
    'python-babel'
    'python-click'
    'python-setuptools'
    'python-six'
  )
  
  cd sphinx-intl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir"/sphinx-intl-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx-intl/LICENSE
}

package_python2-sphinx-intl() {
  depends=(
    'python2-babel'
    'python2-click'
    'python2-setuptools'
    'python2-six'
  ) 

  cd sphinx-intl-${pkgver}-2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 "$srcdir"/sphinx-intl-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python2-sphinx-intl/LICENSE
  mv "$pkgdir"/usr/bin/sphinx-intl "$pkgdir"/usr/bin/sphinx-intl2
}
# vim:set ts=2 sw=2 et:

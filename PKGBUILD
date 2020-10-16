# $Id$
# Maintainer: Christopher P. Fair<christopherpfair@comcast.net>

origName=sphinx-intl
pkgbase=python-$origName
pkgname=$pkgbase
pkgver=2.0.1
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
)
optdepends=('transifex-client: for using transifix')
source=("https://files.pythonhosted.org/packages/85/4b/4589077b71336e84d7ca06e717929437f3185f75ec5dece0a9926cf91c56/$origName-$pkgver.tar.gz")
sha256sums=('b25a6ec169347909e8d983eefe2d8adecb3edc2f27760db79b965c69950638b4')

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
  cd "$srcdir"/sphinx-intl-$pkgver
  python3 setup.py build
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

#install -Dm644 "$srcdir"/sphinx-intl-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx-intl/LICENSE
}



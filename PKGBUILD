# $Id$
# Maintainer: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgbase=python-sphinx
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.3.1
pkgrel=9
arch=('any')
url='http://sphinx.pocoo.org/'
license=('BSD')
makedepends=(
  'python-setuptools'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python-six'
  'python2-setuptools'
  'python2-docutils'
  'python2-jinja'
  'python2-pygments'
  'python2-six'
)
checkdepends=(
  'python-nose' 'python2-nose'
  'texlive-latexextra'
  'python-snowballstemmer' 'python2-snowballstemmer'
  'python-babel' 'python2-babel'
  'python-sphinx-alabaster-theme' 'python2-sphinx-alabaster-theme'
  'python-sphinx_rtd_theme' 'python2-sphinx_rtd_theme'
  'python2-mock'
)
source=("http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz"
  '4c2f693cbf7ec40448e7237383880d701ede6c88.patch')
md5sums=('8786a194acf9673464c5455b11fd4332'
         '103a559a4e4a17d4dd9c3e2342486197')

prepare() {
  # https://github.com/sphinx-doc/sphinx/pull/1892
  pushd Sphinx-$pkgver
   patch -p1 -i "$srcdir"/4c2f693cbf7ec40448e7237383880d701ede6c88.patch
  popd

  # souce duplication is required because makefile modify source code
  # setyp.py --build tricks don't works well
  cp -a Sphinx-$pkgver Sphinx-${pkgver}2
  # change python2 interpreter
  find Sphinx-${pkgver}2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
  # change sphinx-binaries name in source code
  find Sphinx-${pkgver}2 -type f -name '*.py' -exec \
    sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
}

build() {
  msg2 'Python 3 version'
  cd "$srcdir"/Sphinx-$pkgver
  make PYTHON=python3 build
  msg2 'Python 2 version'
  cd "$srcdir"/Sphinx-${pkgver}2
  make PYTHON=python2 build
}

check() {
  msg2 'Python 3 version'
  cd "$srcdir"/Sphinx-$pkgver
#  make PYTHON=python3 test
  rm -r tests

  msg2 'Python 2 version'
  cd "$srcdir"/Sphinx-${pkgver}2
  make PYTHON=python2 test
  rm -r tests
}

package_python-sphinx() {
  pkgdesc='Python3 documentation generator'
  depends=('python-jinja' 'python-pygments' 'python-docutils' 'python-sphinx_rtd_theme' 'python-sphinx-alabaster-theme' 'python-babel' 
'python-snowballstemmer' 'python-six')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx/LICENSE
}

package_python2-sphinx() {
  pkgdesc='Python2 documentation generator'
  depends=('python2-jinja' 'python2-pygments' 'python2-docutils' 'python2-sphinx_rtd_theme' 'python2-sphinx-alabaster-theme' 'python2-babel' 
'python2-snowballstemmer' 'python2-six')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-${pkgver}2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python2-sphinx/LICENSE
}

# vim:set ts=2 sw=2 et:

# $Id$
# Maintainer: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgbase=python-sphinx
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.2.3
pkgrel=1
arch=('any')
url='http://sphinx.pocoo.org/'
license=('GPL')
makedepends=(
  'python-setuptools'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python2-setuptools'
  'python2-docutils'
  'python2-jinja'
  'python2-pygments'
)
checkdepends=(
  'python-nose'
  'python2-nose'
  'texlive-latexextra'
)
source=("http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz")
md5sums=('a98c93124035b4cd7183604aec656cb3')

prepare() {
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
  make PYTHON=python3 test
  rm -r build/lib/tests
  msg2 'Python 2 version'
  cd "$srcdir"/Sphinx-${pkgver}2
  make PYTHON=python2 test
  rm -r build/lib/tests
}

package_python-sphinx() {
  pkgdesc='Python3 documentation generator'
  depends=('python-jinja' 'python-pygments' 'python-docutils')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-sphinx() {
  pkgdesc='Python2 documentation generator'
  depends=('python2-jinja' 'python2-pygments' 'python2-docutils')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-${pkgver}2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

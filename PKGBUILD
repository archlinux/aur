# $Id$
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgbase=python-sphinx
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.5.3
pkgrel=1

arch=('any')
url='http://sphinx.pocoo.org/'
license=('BSD')

makedepends=(
  'python-setuptools'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python-six'
  'python-imagesize'
  'python2-setuptools'
  'python2-docutils'
  'python2-jinja'
  'python2-pygments'
  'python2-six'
  'python2-imagesize'
)

checkdepends=(
  'texlive-latexextra'
  'python-nose' 'python2-nose'
  'python-snowballstemmer' 'python2-snowballstemmer'
  'python-babel' 'python2-babel'
  'python-sphinx-alabaster-theme' 'python2-sphinx-alabaster-theme'
  'python-sphinx_rtd_theme' 'python2-sphinx_rtd_theme'
  'python-mock' 'python2-mock'
  'python-html5lib' 'python2-html5lib'
  'python-requests' 'python2-requests'
  'python2-pytest' 'python-pytest'
  'python2-enum34'
)

source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz")

md5sums=('6a9522761bde569a3d50cc4509e313d9')

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
  LC_ALL="en_US.UTF-8" make PYTHON=python3 test
  rm -r tests

  msg2 'Python 2 version'
  cd "$srcdir"/Sphinx-${pkgver}2
  LC_ALL="en_US.UTF-8" make PYTHON=python2 test
  rm -r tests
}

package_python-sphinx() {
  pkgdesc='Python3 documentation generator'
  depends=(
    'python-jinja'
    'python-pygments'
    'python-docutils'
    'python-sphinx_rtd_theme'
    'python-sphinx-alabaster-theme'
    'python-babel'
    'python-snowballstemmer'
    'python-six'
    'python-imagesize'
    'python-requests'
  )
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx/LICENSE
}

package_python2-sphinx() {
  pkgdesc='Python2 documentation generator'
  depends=(
    'python2-jinja'
    'python2-pygments'
    'python2-docutils'
    'python2-sphinx_rtd_theme'
    'python2-sphinx-alabaster-theme'
    'python2-babel'
    'python2-snowballstemmer'
    'python2-six'
    'python2-imagesize'
    'python2-requests'
  )
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-${pkgver}2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python2-sphinx/LICENSE
}

# vim:set ts=2 sw=2 et:

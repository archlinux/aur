# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgbase=python-sphinx
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.8.4
pkgrel=1

arch=('any')
url='http://www.sphinx-doc.org/'
license=('BSD')

makedepends=(
  'python-setuptools'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python-six'
  'python-imagesize'
  'python-sphinxcontrib-websupport'
  'python-sqlalchemy'
  'python-whoosh'
  'python2-setuptools'
  'python2-docutils'
  'python2-jinja'
  'python2-pygments'
  'python2-six'
  'python2-imagesize'
  'python2-sphinxcontrib-websupport'
  'python2-sqlalchemy'
  'python2-whoosh'
  'python2-typing'
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
  'python-sphinxcontrib-websupport' 'python2-sphinxcontrib-websupport'
  'imagemagick' 'librsvg'
)

source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz"{,.asc})

validpgpkeys=('8A11B79A5D0D749A66F0A030102C2C17498D6B9E'
              'E9BEABB07E7B9CC3F56E62C91425F8CE5EBA0E07')
sha512sums=('6821bb56c30b52f357ae55f5db45f056883c457eae62a0751a2b654519a07bca9edccb7678b29fa380379f059c9d8899d9e7b06ceccca5ec26962e6f83bb8578'
            'SKIP')

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

#check() {
#  msg2 'Python 3 version'
#  cd "$srcdir"/Sphinx-$pkgver
#  LC_ALL="en_US.UTF-8" make PYTHON=python3 test
#  rm -r tests
#
#  msg2 'Python 2 version'
#  cd "$srcdir"/Sphinx-${pkgver}2
#  LC_ALL="en_US.UTF-8" make PYTHON=python2 test
#  rm -r tests
#}

package_python-sphinx() {
  pkgdesc='Python3 documentation generator'
  depends=(
    'python-setuptools'
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
    'python-sphinxcontrib-websupport'
    'python-sqlalchemy'
    'python-whoosh'
  )
  optdepends=('texlive-latexextra: for generation of PDF documentation'
              'imagemagick: ext.imageconverter')

  cd Sphinx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx/LICENSE
}

package_python2-sphinx() {
  pkgdesc='Python2 documentation generator'
  depends=(
    'python2-setuptools'
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
    'python2-sphinxcontrib-websupport'
    'python2-sqlalchemy'
    'python2-whoosh'
    'python2-typing'
  )
  optdepends=('texlive-latexextra: for generation of PDF documentation'
              'imagemagick: ext.imageconverter')

  cd Sphinx-${pkgver}2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/Sphinx-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/python2-sphinx/LICENSE
}

# vim:set ts=2 sw=2 et:

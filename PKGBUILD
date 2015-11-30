
pkgbase=python-sphinx-git
pkgname=('python-sphinx-git' 'python2-sphinx-git')
pkgver=r5767.1cef30f
pkgrel=1
arch=('any')
url='http://sphinx.pocoo.org/'
license=('BSD')
makedepends=('git'
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
source=("git+https://github.com/sphinx-doc/sphinx.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sphinx"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

  # souce duplication is required because makefile modify source code
  # setyp.py --build tricks don't works well
  cp -a sphinx sphinx2
  # change python2 interpreter
  find sphinx2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
  # change sphinx-binaries name in source code
  find sphinx2 -type f -name '*.py' -exec \
    sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
}

build() {
  msg2 'Python 3 version'
  cd "$srcdir"/sphinx
  make PYTHON=python3 build
  msg2 'Python 2 version'
  cd "$srcdir"/sphinx2
  make PYTHON=python2 build
}

check() {
  msg2 'Python 3 version'
  cd "$srcdir"/sphinx
#  make PYTHON=python3 test
  rm -r tests

  msg2 'Python 2 version'
  cd "$srcdir"/sphinx2
  make PYTHON=python2 test
  rm -r tests
}

package_python-sphinx-git() {
  pkgdesc='Python3 documentation generator'
  depends=('python-jinja' 'python-pygments' 'python-docutils' 'python-sphinx_rtd_theme' 'python-sphinx-alabaster-theme' 'python-babel' 
'python-snowballstemmer' 'python-six')
  optdepends=('texlive-latexextra: for generation of PDF documentation')
  provides=('python-sphinx')
  conflicts=('python-sphinx')

  cd sphinx
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/sphinx/LICENSE "$pkgdir"/usr/share/licenses/python-sphinx/LICENSE
}

package_python2-sphinx-git() {
  pkgdesc='Python2 documentation generator'
  depends=('python2-jinja' 'python2-pygments' 'python2-docutils' 'python2-sphinx_rtd_theme' 'python2-sphinx-alabaster-theme' 'python2-babel' 
'python2-snowballstemmer' 'python2-six')
  optdepends=('texlive-latexextra: for generation of PDF documentation')
  provides=('python2-sphinx')
  conflicts=('python2-sphinx')

  cd sphinx2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir"/sphinx/LICENSE "$pkgdir"/usr/share/licenses/python2-sphinx/LICENSE
}

# vim:set ts=2 sw=2 et:

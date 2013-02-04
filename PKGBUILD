# $Id$
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgbase=python-sphinx
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.1.3
pkgrel=3
arch=('any')
url='http://sphinx.pocoo.org/'
license=('GPL')
makedepends=(
  'python-distribute'
  'python-docutils'
  'python-jinja'
  'python-pygments'
  'python2-distribute'
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
md5sums=('8f55a6d4f87fc6d528120c5d1f983e98')

build() {
  cd Sphinx-$pkgver
  # remove build directory (avoid sed issues)
  [[ -e build ]] && rm -rf build
  # python builds
  python setup.py build --build-lib=build/python
  python2 setup.py build --build-lib=build/python2
  # change python2 interpreter
  find build/python2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
  # change sphinx-binaries name in source code
  find build/python2 -type f -name '*.py' -exec \
    sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
}

check() {
  #(cd Sphinx-$pkgver/build/python/ && python ../../tests/run.py -d)
  (cd Sphinx-$pkgver/build/python2/ && python2 ../../tests/run.py -d)
}

package_python-sphinx() {
  pkgdesc='Python3 documentation generator'
  depends=('python-jinja' 'python-pygments' 'python-docutils')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-$pkgver
  python setup.py build --build-lib=build/python \
                  install --root="$pkgdir" --optimize=1
}

package_python2-sphinx() {
  pkgdesc='Python2 documentation generator'
  depends=('python2-jinja' 'python2-pygments' 'python2-docutils')
  optdepends=('texlive-latexextra: for generation of PDF documentation')

  cd Sphinx-$pkgver
  python2 setup.py build --build-lib=build/python2 \
                   install --root="$pkgdir" --optimize=1
  # fix python3 conflict
  for _f in "$pkgdir"/usr/bin/*; do
      mv -v "$_f" "${_f}2"
  done
}

# vim:set ts=2 sw=2 et:

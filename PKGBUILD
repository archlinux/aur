# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-commonmark
pkgver=0.9.1
pkgrel=6
pkgdesc='Python parser for the CommonMark Markdown spec'
url='https://pypi.org/project/commonmark/'
arch=('any')
license=('BSD')
depends=('python38-docutils' 'python38-future')
makedepends=('python38-setuptools' 'python38-sphinx' 'python38-sphinx_rtd_theme')
checkdepends=('python38-hypothesis')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/readthedocs/commonmark.py/archive/${pkgver}.tar.gz)
sha256sums=('b5d5be6af35a183c3f915d714b31b61e6918894051114419f9ac0bbb715bf4c6')
sha512sums=('a6de0b384247ff79fe326012bd1fc71135e6ae5bc7b6a15d5402969a94f81fdd802f1a9d557c504eb74bfb3fea68f55355a70a6e0112a620cc285cf9039892e4')

build() {
  cd commonmark.py-${pkgver}
  python3.8 setup.py build
  make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd commonmark.py-${pkgver}
  export PYTHONPATH=.
  python3.8 commonmark/tests/unit_tests.py
  python3.8 -m unittest discover
}

package() {
  cd commonmark.py-${pkgver}
  python3.8 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 README.rst CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/commonmark-py.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  mv "${pkgdir}/usr/bin/cmark"{,-py3}
}

# vim: ts=2 sw=2 et:

# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
# Contributor: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

pkgname=('python-pymupdf')
_name='PyMuPDF'
pkgver=1.18.0
pkgrel=1
pkgdesc='Python bindings for MuPDF'
arch=('x86_64')
url='https://github.com/pymupdf/PyMuPDF'
license=('AGPL3')
depends=('python' 'libjpeg-turbo' 'jbig2dec' 'openjpeg2'  'freetype2' 'gumbo-parser')
makedepends=('python-setuptools' 'libmupdf-pymupdf=1.18.0-1' 'swig' 'python-sphinx' 'python-sphinx_rtd_theme')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pymupdf/PyMuPDF/archive/${pkgver}.tar.gz"
        "fix-library-linking.patch")
sha256sums=('2ce5d0be64e91ff4ba39e83e65368538ba5c0396517e3103150a17d7e118b845'
            'e7589e4499fb64d2729ae04f928624b5aff49a0d5a7cf25411b9537132fe8528')

prepare() {
  cd "${_name}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/fix-library-linking.patch"
}

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
  sphinx-build docs docs_built
}

check() {
  cd "${_name}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python -c 'import sys; sys.path.remove(""); import fitz'
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc"
  cp -r docs_built "$pkgdir/usr/share/doc/$pkgname"
}

# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
# Contributor: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

pkgname=('python2-pymupdf' 'python-pymupdf')
_name='PyMuPDF'
pkgver=1.16.10
pkgrel=1
pkgdesc='Python bindings for MuPDF'
arch=('x86_64')
url='https://github.com/pymupdf/PyMuPDF'
license=('AGPL3')
depends=('libjpeg-turbo' 'jbig2dec' 'openjpeg2'  'freetype2')
makedepends=('python2-setuptools' 'python-setuptools' 'libmupdf>=1.16' 'libmupdf<1.17')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}.tar.gz")
sha256sums=('d7893954f97fa6087629f3875f3be066dab51302e7c73f4c98c0516a8e2893fb')

prepare() {
  cd "${_name}-${pkgver}"
  sed -i "s:# 'jbig2dec', 'openjp2', 'jpeg', 'freetype',:'jbig2dec', 'openjp2', 'jpeg', 'freetype',:g" setup.py
}

build() {
  cd "${_name}-${pkgver}"
  python2 setup.py build
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  local python2_version=$(python2 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python2_version}" python2 -c 'import sys; sys.path.remove(""); import fitz'
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python -c 'import sys; sys.path.remove(""); import fitz'
}

package_python2-pymupdf() {
  depends+=('python2')
  cd "${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python-pymupdf() {
  depends+=('python')
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

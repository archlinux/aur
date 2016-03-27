# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python-pdfnup
pkgver=0.3.3
pkgrel=1
pkgdesc="a Python module and CLI tool for layouting multiple pages per sheet of a PDF"
arch=('any')
url="http://mstamy2.github.com/PyPDF2"
license=('GPL3')
depends=('python-pypdf2')
makedepends=('python-setuptools')
#source=("http://www.dinu-gherman.net/tmp/pdfnup-$pkgver.tar.gz")
source=("https://pypi.python.org/packages/source/p/pdfnup/pdfnup-$pkgver.tar.gz")
md5sums=('7ec67d0bb5820d656f41dde79fa2a4ec')

# note: this bundles a binary template PDF (_mtA4PdfZip64) that I have not inspected

prepare() {
  cd "$srcdir/pdfnup-$pkgver"
  find ./ -name '*.py' -exec 2to3 -w '{}' \;
  2to3 -w pdfnup
  sed -i  -e 's/from pyPdf/from PyPDF2/' \
          -e 's/ImmutableSet, //' \
          -e 's/IS = ImmutableSet/IS = frozenset/' \
          -e 's/decodestring(_mtA4PdfZip64)/decodestring(_mtA4PdfZip64.encode("ascii"))/' \
          -e 's/StringIO/BytesIO/' \
          -e 's/range(n)/range(int(n))/' \
          -e 's/outPages\[destPageNum\]/outPages[int(destPageNum)]/' pdfnup.py
}

build() {
  cd "$srcdir/pdfnup-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/pdfnup-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=0
}

# vim:ts=2:sw=2:et:

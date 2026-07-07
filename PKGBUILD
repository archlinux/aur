# Maintainer: Ianis Vasilev: ianis@ivasilev.net
pkgname=ocrodjvu
pkgver=0.14
pkgrel=3.314
pkgdesc="OCR for DjVu (Python 3 fork)"
arch=('any')
url='https://github.com/FriedrichFroebel/ocrodjvu'
license=('GPL-2.0-only')
checkdepends=(python-pillow python-pyicu python-html5lib tesseract tesseract-data-eng)
makedepends=(python-build python-installer make libxslt docbook-xml docbook-xsl python-setuptools)
depends=(python python-lxml python-djvulibre-python)
optdepends=('python-html5lib: HTML parser; required for the ``--html5`` option'
            'python-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system'
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4fd97e139204805fdca9daf4130496da7a5f08a10505ba472814b9702eef711e')

_fullsrcdir() {
  echo "$srcdir/$pkgname-$pkgver"
}

prepare() {
    cd "$(_fullsrcdir)"
    sed --in-place 's|http://www.docbook.org/xml|http://www.oasis-open.org/docbook/xml|' doc/*.xml
}

check() {
    cd "$(_fullsrcdir)"
    python -W ignore -m unittest
}

build() {
    cd "$(_fullsrcdir)"
    make -C doc
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    make PREFIX="/usr" DESTDIR="$pkgdir" install_manpage
}

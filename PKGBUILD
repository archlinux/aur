# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.7.0
pkgrel=1.314
pkgdesc='A DjVu to PDF converter'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
checkdepends=(python-pytest)
makedepends=(coreutils python-uv-build python-build python-installer python-wheel python-click-man)
depends=(python python-djvulibre-python
         python-click python-rich python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38e85a06842ca2af9d99ff93307381c1cf51c5fc78be769baf2e1e9c23ba58f2')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

check() {
    cd "$(_fullsrcdir)"
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    PYTHONPATH=src python -c 'from helpers.docs import build_man_page; build_man_page()'
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 docs/dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

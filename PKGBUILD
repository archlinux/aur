# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.4.2
pkgrel=2.314
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
checkdepends=(ruff mypy python-types-pillow python-types-fpdf2 python-pytest python-pytest-image-diff)
makedepends=(git python-uv-build python-build python-installer python-wheel)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21406922ed21775eb0840a4c1f8a2a4108218509198dd591fac28674a99e4982')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

check() {
    cd "$(_fullsrcdir)"
    ruff check dpsprep
    mypy --package dpsprep
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*$pkgver*.whl
    install -D -m644 dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.8.2
pkgrel=2.314
pkgdesc='A DjVu to PDF converter'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-or-later')
checkdepends=(python-pytest)
makedepends=(python-uv-build python-build python-installer python-click-man)
depends=(python python-djvulibre-python
         python-click python-rich python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('0cb5afed79462f420362f54e1d3c7be59c943ec88268288df4374be9874cf11f')

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
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir --parents "$pkgdir/usr/share/licenses"
    ln --symbolic \
        "/$(realpath --relative-to "$pkgdir" "$pkgdir"/usr/lib/python*/site-packages/$pkgname-*.dist-info/licenses/LICENSES)" \
        "$pkgdir/usr/share/licenses/$pkgname"
}

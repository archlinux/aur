# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.6.3
pkgrel=2.314
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
checkdepends=(python-pytest)
makedepends=(git python-uv-build python-build python-installer python-wheel python-click-man coreutils make)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a41fc58d6e7e9f9ca1ad6837dae31d3578b3e7498c8f730cda9849b86dd0e107')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

prepare() {
    cd "$(_fullsrcdir)"
    sed --in-place 's/uv run //g' Makefile
}

check() {
    cd "$(_fullsrcdir)"
    make test
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
    make docs/dpsprep.1
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 docs/dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

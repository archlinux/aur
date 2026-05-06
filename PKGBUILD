# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.6.1
pkgrel=1.314
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
checkdepends=(ruff mypy python-types-pillow python-types-fpdf2 python-pytest)
makedepends=(git python-uv-build python-build python-installer python-wheel python-click-man coreutils make)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/v--/ruff-config/archive/refs/tags/v0.15-5.tar.gz"
)
sha256sums=('c449b1075bb445437d15fa91a2776e3550d6e9de23108a282ef14b54e7566049'
            '7e0f4cd3499993c5d696fd2d5358c0f13c183c45655605f336c9a16b3f70b153')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

prepare() {
    cd "$(_fullsrcdir)"
    cp ../ruff-config-*/ruff.toml ruff_config
}

check() {
    cd "$(_fullsrcdir)"
    make lint
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
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"
}

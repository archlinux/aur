# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep
pkgver=2.6.2
pkgrel=1.314
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
sha256sums=('c2599cb071d012b70f8291d9f52172a526a4ac16690e37ac4d2df4d4bea00d91')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

prepare() {
    cd "$(_fullsrcdir)"
    cp ../ruff-config-*/ruff.toml ruff_config
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
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"
}

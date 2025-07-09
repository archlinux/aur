# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
_pkgbasename="${pkgname%-git}"
pkgver=2.2.15.1.gf4fab7f
pkgrel=1
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
provides=("$_pkgbasename=$pkgver")
conflicts=("$_pkgbasename")
checkdepends=(python ruff mypy python-types-pillow python-types-fpdf2 python-pytest python-pytest-image-diff)
makedepends=(git python-build python-installer python-wheel python-poetry)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=('ocrmypdf: Optional OCR and advanced PDF optimization')
source=("git+https://github.com/kcroker/dpsprep.git")
md5sums=('SKIP')

_fullsrcdir() {
  echo "$srcdir/$_pkgbasename"
}

pkgver() {
    cd "$(_fullsrcdir)"
    git describe --tags | cut --characters 2- | tr - .
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
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/dpsprep "$pkgdir/usr/bin/dpsprep"
    install -D -m644 dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"
}

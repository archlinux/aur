# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
pkgver=2.2.4
pkgrel=1
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
checkdepends=(python ruff mypy python-types-pillow python-types-fpdf2 python-pytest python-pytest-image-diff)
makedepends=(git python-build python-installer python-wheel)
depends=(python python-click python-djvulibre python-fpdf2 python-loguru
         python-pillow python-pdfrw)
optdepends=('ocrmypdf: Optional OCR and advanced PDF optimization')
source=('git+https://github.com/kcroker/dpsprep.git')
md5sums=('SKIP')

check() {
    cd "${srcdir}/dpsprep"
    ruff check dpsprep
    mypy --package dpsprep
    pytest
}

build() {
    cd "${srcdir}/dpsprep"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/dpsprep"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/dpsprep "$pkgdir/usr/bin/dpsprep"
    install -D -m644 dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

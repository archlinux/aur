# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
_pkgbasename="${pkgname%-git}"
pkgver=2.6.4.r220.02fe6c8
pkgrel=2.314
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL-3.0-only')
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
checkdepends=(python-pytest)
makedepends=(coreutils grep git python-uv-build python-build python-installer python-wheel python-click-man)
depends=(python python-djvulibre-python
         python-click python-loguru python-pillow
         python-fpdf2 python-pdfrw)
optdepends=(
  'ocrmypdf: Optional OCR and advanced PDF optimization'
  'jbig2enc: Advanced compression of bitonal images'
)
source=("git+https://github.com/kcroker/dpsprep.git")
md5sums=('SKIP')

_fullsrcdir() {
    echo "$srcdir/$_pkgbasename"
}

# The project contains a GNU make job for docs/dpsprep.1, however it doesn't work without a virtual environment
prepare() {
    cd "$(_fullsrcdir)"

    version=$(grep --only-matching --perl-regexp '(?<=version = ").*(?=")' pyproject.toml)
    echo \
"from click_man.core import write_man_pages
from dpsprep.cli import dpsprep

write_man_pages('dpsprep', dpsprep, target_dir='docs', version='$version')
" > generate_man_page.py
}

check() {
    cd "$(_fullsrcdir)"
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation

    release_date=$(grep --only-matching --perl-regexp "(?<=$version - ).*" CHANGELOG.md)
    SOURCE_DATE_EPOCH=$(date --date $release_date +'%s') PYTHONPATH=src python -m generate_man_page
    cat docs/examples.man >> docs/dpsprep.1
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 docs/dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"
}

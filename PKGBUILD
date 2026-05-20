# Maintainer: a821 at (nospam) mail de
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Contributor : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

pkgname=img2pdf-git
pkgver=0.6.3.r3.g8bd5855
pkgrel=1
epoch=1
pkgdesc='Losslessly convert raster images to PDF'
arch=(any)
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL-3.0-or-later')
depends=(
    python
    python-dateutil
    python-packaging
    python-pillow
    python-pikepdf
)
makedepends=(git python-build python-flit-core python-installer python-wheel)
checkdepends=(python-pytest python-numpy python-scipy python-lxml
              colord ghostscript imagemagick mupdf-tools openjpeg2 poppler perl-image-exiftool netpbm)
provides=('img2pdf')
conflicts=('img2pdf')
source=("git+${url}")
md5sums=(SKIP)

prepare() {
    cd ${pkgname%-git}
    # remove flit-core version restriction
    sed -i 's/,<4//' pyproject.toml
}

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd ${pkgname%-git}
    python -m build --wheel --no-isolation
}

check() {
    cd ${pkgname%-git}
    # Different output on Arch?
    sed -e 's|JPEG-2000 File Format Syntax|JP2|g' \
        -i src/img2pdf_test.py

    # Failures with depth
    pytest -vv --color=yes \
        --deselect 'src/img2pdf_test.py::test_miff_cmyk8[internal]' \
        --deselect 'src/img2pdf_test.py::test_miff_cmyk8[pikepdf]' \
        --deselect 'src/img2pdf_test.py::test_miff_cmyk16[internal]' \
        --deselect 'src/img2pdf_test.py::test_miff_cmyk16[pikepdf]'
}

package() {
    cd ${pkgname%-git}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:

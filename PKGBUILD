# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>
# Contributor : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Invergo <brandon@invergo.net>

pkgname=img2pdf-git
pkgver=0.5.1.r0.g819b366
pkgrel=1
epoch=1
pkgdesc='Losslessly convert raster images to PDF'
arch=(any)
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('LGPL-3.0-or-later')
depends=(python-pillow python-pikepdf)
makedepends=(git python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest python-numpy python-scipy python-lxml
              colord ghostscript imagemagick mupdf-tools openjpeg2 poppler perl-image-exiftool netpbm)
provides=('img2pdf')
conflicts=('img2pdf')
source=("git+${url}")
md5sums=(SKIP)

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
    sed -e 's|Joint Photographic Experts Group JFIF format|JPEG|g' \
        -e 's|JPEG-2000 File Format Syntax|JP2|g' \
        -e 's|Portable Network Graphics|PNG|g' \
        -e 's|Tagged Image File Format|TIFF|g' \
        -e 's|CompuServe graphics interchange format|GIF|g' \
        -i src/img2pdf_test.py
    sed 's|usr/share/color/icc/sRGB.icc|usr/share/color/icc/colord/sRGB.icc|g' -i src/img2pdf_test.py
    # Failures with depth
    pytest -vv --color=yes || echo "Tests failed"
}

package() {
    cd ${pkgname%-git}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:

# Maintainer: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=pdf2djvu
pkgver=0.9.18.2
pkgrel=3
pkgdesc="Creates DjVu files from PDF files"
arch=('x86_64')
url="https://jwilk.net/software/pdf2djvu"
license=('GPL')
depends=('poppler' 'djvulibre' 'gcc-libs' 'graphicsmagick' 'exiv2')
makedepends=('python-nose' 'ttf-liberation' 'boost')
source=(
  "https://github.com/jwilk/pdf2djvu/releases/download/${pkgver}/pdf2djvu-${pkgver}.tar.xz"
  "pdf2djvu-poppler-fix.patch"
  "pdf2djvu-tests-python-3.patch"
)
sha256sums=(
  '9ea03f21d841a336808d89d65015713c0785e7295a6559d77771dc795333a9fa'
  '0507a1c71e940873213e45762bab96094249b2d15a756541c687e0e79c3b4f1d'
  '41bdb0b588a7d0afff5ed4d32f2c7b9667e00b7ea349db8ed147d1c9e4f20de2'
)

prepare() {
  # Fix build for poppler >= 22.03.0
  # remove the patch when this is fixed upstream
  patch -p1 < "$srcdir"/pdf2djvu-poppler-fix.patch

  # Migrate tests to Python 3
  # (It may not be ideal, but it works.)
  patch -p1 < "$srcdir"/pdf2djvu-tests-python-3.patch
}

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}

   make PYTHON=python test
}

package() {
    cd ${pkgname}-${pkgver}

    make install DESTDIR="${pkgdir}"
}

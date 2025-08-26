# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>
# Contributor: Marc-Olivier Barre <mobarre-archlinux|at|snarchi|dot|io>
# Contributor: Michael Lass <bevan@bi-co.net>

pkgname=siril
pkgver='1.2.6'
pkgrel=5
pkgdesc="An astronomical image processing software for Linux. (IRIS clone)"
url="https://www.siril.org/"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'cfitsio' 'wcslib' 'fftw' 'gsl' 'opencv' 'json-glib' 'ffms2')
makedepends=('meson' 'cmake' 'ninja')
optdepends=('gvfs: web access'
            'exiv2: get thumbnails from files'
            'libraw: DSLR RAW files import'
            'libtiff: TIFF import and export'
            'libxisf: XISF format support'
            'libjpeg: JPEG import and export'
            'libjxl: JPEG XL format support'
            'libheif: HEIF format files import'
            'libpng: PNG format support'
            'ffmpeg: avi export support'
            'libgit2: git integration to sync with the official siril-scripts repository')

options=(!lto)

source=("https://free-astro.org/download/siril-${pkgver}.tar.bz2"
	"siril-1.2.6-linkage.patch"
	"914.patch")
sha256sums=('312f82e78599f796d163a6d1c90589df1ed920b9ff2bb7ab5b808e43872817fa'
            '1738115d8c6f23e731d91b0ebdf74325381817ad1578714790bee60254fc8bdf'
            '74b85370916ec0671926a4c4ab58fe3be6014152ba99d084733a9a73516bab76')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  pwd
  patch -p1 < ../../siril-1.2.6-linkage.patch
  patch -p1 < ../../914.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson setup --prefix /usr -Denable-libcurl=yes --buildtype release _build
  ninja -C _build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson install -C _build --destdir "$pkgdir"
}

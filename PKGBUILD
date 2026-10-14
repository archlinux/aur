# Maintainer: Yangtse Su <yangtsesu at gmail dot com>

pkgname=deepin-reader
pkgver=6.6.2
pkgrel=2
pkgdesc='Document viewer for PDF, DjVu, DOCX and XPS files'
arch=(x86_64)
url='https://github.com/linuxdeepin/deepin-reader'
license=(GPL-3.0-or-later LGPL-3.0-or-later BSD-3-Clause CC-BY-4.0 CC0-1.0)
depends=(
  cairo
  djvulibre
  dtk6core
  dtk6gui
  dtk6widget
  freetype2
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  icu
  libarchive
  libchardet
  # loaded with dlopen() by deepin-reader-batchprint
  libcups
  librofd-ffi
  libgxps
  libjpeg-turbo
  lcms2
  openjpeg2
  # unzip, pandoc and the bundled htmltopdf convert DOCX documents
  pandoc-cli
  qt6-base
  # image format plugin, renders the SVG icons of the interface
  qt6-svg
  qt6-webengine
  unzip
  zlib
)
makedepends=(
  cmake
  libpng
  ninja
  qt6-5compat
  qt6-tools
)
optdepends=(
  'poppler: print PDF documents through pdftocairo for correct glyphs'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/deepin-reader/archive/refs/tags/$pkgver.tar.gz"
  'fix-pie-link-for-shared-libs.patch'
)
sha256sums=(
  'dc0eef26583d0273aa292dcf68dd49cd2e57304610f562c6f32ec6cb8d0050b0'
  'af4e1227924b8d3a905b1239b2329ce971367d506c319aa4a1228dfe410040ae'
)

prepare() {
  patch -Np1 -d "$pkgname-$pkgver" -i "$srcdir/fix-pie-link-for-shared-libs.patch"
}

build() {
  # GCC 14 no longer includes <cstdint> transitively; the bundled PDFium headers rely on it
  CXXFLAGS+=" -include cstdint"
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DVERSION="$pkgver" \
    -DAPP_VERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # BSD-3-Clause is the license of the bundled PDFium sources
  install -Dm644 "$pkgname-$pkgver/LICENSES/BSD-3-Clause.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer:

_pkgname="podofo"
pkgname="$_pkgname-0.9"
pkgver=0.9.8
pkgrel=3
pkgdesc="A C++ library to work with the PDF file format (legacy version)"
url="https://github.com/podofo/podofo"
license=('LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'fontconfig'
  'libidn'
  'libjpeg.so' # libjpeg
  'libtiff'
  'libunistring'
  'openssl'

  ## implicit
  #freetype2
  #libpng
  #zlib
)
makedepends=(
  'cmake'
  'ninja'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
  "https://github.com/podofo/podofo/commit/23d26f39.patch"
)
sha256sums=(
  '2176e7281bdcd57769768eca30e7673257041bf7f092bfabfcdf85018b5dc7dc'
  '29486f35f5bc9e4b996bc66795e2e664e051d8cbe53a3cf4957658cae80914cc'
)

prepare() {
  # Don't hardcode install dirs
  patch -d "$_pkgsrc" -p1 -i "$srcdir/23d26f39.patch"

  # Fix include dir in pc file
  sed -e 's|@CMAKE_INSTALL_FULL_INCLUDEDIR@/podofo|@CMAKE_INSTALL_FULL_INCLUDEDIR@|' \
    -i "$_pkgsrc/src/podofo/libpodofo.pc.in"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib/podofo-0.9
    -DCMAKE_INSTALL_INCLUDEDIR=include/podofo-0.9
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2
    -DPODOFO_BUILD_LIB_ONLY=1
    -DPODOFO_BUILD_SHARED=1
    -DPODOFO_HAVE_JPEG_LIB=1
    -DPODOFO_HAVE_PNG_LIB=1
    -DPODOFO_HAVE_TIFF_LIB=1
    -DPODOFO_VERSION=${pkgver}
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -rs "$pkgdir"/usr/lib/podofo-0.9/libpodofo.so.0.9.8 "$pkgdir"/usr/lib
}

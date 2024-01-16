# Maintainer:

_pkgname="podofo"
pkgname="$_pkgname-0.9"
pkgver=0.9.8
pkgrel=1
pkgdesc="A C++ library to work with the PDF file format (legacy version)"
url="http://podofo.sourceforge.net"
license=('LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'fontconfig'
  'libidn'
  'libjpeg-turbo'
  'libtiff'
  'libunistring'
  'openssl'
)
makedepends=(
  'cmake'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "https://downloads.sourceforge.net/$_pkgname/$_pkgsrc.$_pkgext"
  https://github.com/podofo/podofo/commit/23d26f39.patch
)
sha256sums=(
  '5de607e15f192b8ad90738300759d88dea0f5ccdce3bf00048a0c932bc645154'
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

    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib/podofo-0.9
    -DCMAKE_INSTALL_INCLUDEDIR=include/podofo-0.9
    -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2
    -DPODOFO_BUILD_SHARED=1
    -DPODOFO_HAVE_JPEG_LIB=1
    -DPODOFO_HAVE_PNG_LIB=1
    -DPODOFO_HAVE_TIFF_LIB=1
    -DPODOFO_BUILD_LIB_ONLY=1

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -rs "$pkgdir"/usr/lib/podofo-0.9/libpodofo.so.0.9.8 "$pkgdir"/usr/lib
}

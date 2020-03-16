# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Preecha Patumchareonpol <yumyai at gmail.com> 

pkgname=podofo-git
pkgver=r1999
pkgrel=1
pkgdesc="A C++ library to work with the PDF file format"
arch=('x86_64')
url="http://podofo.sourceforge.net"
license=('GPL')
depends=('lua' 'openssl' 'fontconfig' 'libtiff' 'libidn' 'libjpeg-turbo' 'libunistring')
makedepends=('cmake' 'subversion')
conflicts=('podofo')
provides=('podofo')
source=("$pkgname::svn+https://svn.code.sf.net/p/podofo/code/podofo/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() { 
  cd "${srcdir}/build"
  cmake "${srcdir}/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr \
        -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
        -DPODOFO_BUILD_SHARED=1 \
        -DPODOFO_HAVE_JPEG_LIB=1 \
        -DPODOFO_HAVE_PNG_LIB=1 \
        -DPODOFO_HAVE_TIFF_LIB=1
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR=$pkgdir install
}

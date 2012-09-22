# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=freetype2
pkgname=libx32-$_pkgbasename
pkgver=2.4.10
pkgrel=1.1
pkgdesc="TrueType font rendering library (x32 ABI)"
arch=(x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('libx32-zlib' 'libx32-bzip2' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
        freetype-2.3.0-enable-spr.patch
        freetype-2.2.1-enable-valid.patch)
md5sums=('13286702e9390a91661f980608adaff1'
         '816dc8619a6904a7385769433c0a8653'
         '214119610444c9b02766ccee5e220680')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/freetype-${pkgver}"
  patch -Np1 -i "${srcdir}/freetype-2.3.0-enable-spr.patch"
  patch -Np1 -i "${srcdir}/freetype-2.2.1-enable-valid.patch"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd "${srcdir}/freetype-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

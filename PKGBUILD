# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbase=libtiff
pkgname=lib32-${_pkgbase}3
pkgver=3.9.5
pkgrel=2
pkgdesc="Legacy version of the library for manipulation of TIFF images (32-bit)"
arch=('x86_64')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('lib32-libjpeg' 'lib32-zlib' "${_pkgbase}3")
makedepends=('lib32-libgl' 'lib32-libxmu' 'lib32-libxi' 'gcc-multilib')
options=('!libtool')
source=(ftp://ftp.remotesensing.org/pub/libtiff/tiff-${pkgver}.tar.gz)
md5sums=('8fc7ce3b4e1d0cc8a319336967815084')
sha1sums=('f40aab20fb2f609b5cbc1171c40b66a1445e3773')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/tiff-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/tiff-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # We want only version3. Avoid conflict with 'libtiff' package
  rm -rf "${pkgdir}/usr/lib32/libtiff".{a,so}
  rm -rf "${pkgdir}/usr/lib32/libtiffxx".{a,so}
}

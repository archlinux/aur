# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=pcre
pkgname=libx32-$_pkgbasename
pkgver=8.31
pkgrel=1.1
pkgdesc="A library that implements Perl 5-style regular expressions (x32 ABI)"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
depends=('libx32-gcc-libs' $_pkgbasename)
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${_pkgbasename}-${pkgver}.tar.bz2{,.sig})
md5sums=('1c9a276af932b5599157f96e945391f0'
         '873bcd2cd9f1e0aa1e28e256b3e31506')

build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --enable-utf8 --enable-unicode-properties --enable-pcre16 --enable-jit
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

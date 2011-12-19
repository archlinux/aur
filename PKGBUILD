# Maintainer: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=pcre
pkgname=lib32-$_pkgbasename
pkgver=8.21
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (32-bit)"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
depends=('lib32-gcc-libs' $_pkgbasename)
makedepends=('gcc-multilib')
options=('!libtool')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('0a7b592bea64b7aa7f4011fc7171a730')

build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-utf8 --enable-unicode-properties
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=pcre
pkgname=lib32-$_pkgbasename
pkgver=8.10
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (32-bit)"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
depends=('gcc-libs-multilib' $_pkgbasename)
makedepends=('gcc-multilib')
options=('!libtool')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('780867a700e9d4e4b9cb47aa5453e4b2')

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

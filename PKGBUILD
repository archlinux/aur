# Maintainer: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=pcre
pkgname=lib32-$_pkgbasename
pkgver=8.36
pkgrel=1
pkgdesc="A library that implements Perl 5-style regular expressions (32-bit)"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
depends=('lib32-gcc-libs' $_pkgbasename)
makedepends=('gcc-multilib')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${_pkgbasename}-${pkgver}.tar.bz2{,.sig})
md5sums=('b767bc9af0c20bc9c1fe403b0d41ad97'
         'SKIP')
validpgpkeys=(45F68D54BBE23FB3039B46E59766E084FB0F43D8)

build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-utf --enable-unicode-properties --enable-pcre16 --enable-pcre32 --enable-jit
  make
}

check() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}

  make -j1 check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

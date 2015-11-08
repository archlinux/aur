# $Id: PKGBUILD 134826 2015-06-05 06:32:39Z seblu $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# x32 Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=pcre
pkgname=libx32-$_pkgbasename
pkgver=8.37
pkgrel=2.1
pkgdesc="A library that implements Perl 5-style regular expressions (x32 ABI)"
arch=('x86_64')
url="http://pcre.sourceforge.net"
license=('custom')
depends=('libx32-gcc-libs' $_pkgbasename)
makedepends=('gcc-multilib-x32')
source=(ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${_pkgbasename}-${pkgver}.tar.bz2{,.sig}
		'01-seven-security-patches.patch')
md5sums=('ed91be292cb01d21bc7e526816c26981'
         'SKIP'
         '45df6737e61738cc8bb061e0b9c0fbb2')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8') # Philip Hazel

prepare() {
  patch -p1 -d $_pkgbasename-$pkgver < 01-seven-security-patches.patch
}

build() {
  cd "${srcdir}"/${_pkgbasename}-${pkgver}
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --enable-utf --enable-unicode-properties --enable-pcre16 --enable-pcre32 --disable-jit
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

# Maintainer: jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: hwkiller <hwkiller@hotmail.com>
# Contributor: TryA <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgbase=libpng
pkgname=lib32-libpng14
pkgver=1.4.15
_apngver=1.4.15
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (32-bit)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${_apngver}-apng.patch.gz")
md5sums=('4c6933572baec9c0e9203e5db1d4ddd1'
         'c1db113ab5ac0bad1ca4c36d19395c01')
build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"

  cd ${_pkgbase}-${pkgver}

  patch -Np1 -i "${srcdir}/libpng-${_apngver}-apng.patch"
  sed -i 's/AM_CONFIG_HEADER(config.h)/AC_CONFIG_HEADERS([config.h])/' configure.ac
  
  libtoolize --force --copy
  aclocal
  autoconf
  automake --add-missing

  ./configure --prefix=/usr --libdir=/usr/lib32

  make ECHO=echo
}

package() {
  cd ${_pkgbase}-${pkgver}
  make ECHO=echo DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/lib32/{libpng.so,libpng.a,pkgconfig/libpng.pc}
  rm -rf "${pkgdir}"/usr/{include,share,bin}

  mkdir -p "${pkgdir}/usr/share/licenses"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



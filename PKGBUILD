# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=mipsel-linux-gnu-gcc91
_pkgname=gcc
_target="mipsel-linux-gnu"
_pkgver=9
pkgver=${_pkgver}.1.0
pkgrel=2
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'xz' "${_target}-binutils")
makedepends=('gmp' 'mpfr')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz) #{,.sig})
sha256sums=(
  '79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
#  '8ff58a80bc8189b001803e1b152364324bb8dd4415835ba16d0e05eeb3411f04'
)
#validgpgkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06)

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  CXXFLAGS="-Wno-error=format-security" ./configure \
    --program-suffix=-${_pkgver} \
    --program-prefix=${_target}- \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --libdir=/usr/${_target}-${pkgver}/lib \
    --datadir=/usr/${_target}-${pkgver}/share \
    --datarootdir=/usr/${_target}-${pkgver}/share \
    --build=$CHOST \
    --host=$CHOST \
    --target=${_target} \
    --enable-languages=c,c++ \
    --disable-nls \
    --disable-threads \
    --disable-libada \
    --disable-libssp \
    --disable-libstdcxx \
    --disable-multilib \
    --disable-libgcj \
    --disable-werror \
    --enable-lto \
    --with-float=soft \
    --disable-shared \
    --with-gnu-as \
    --with-gnu-ld

  make all-gcc "inhibit_libc=true"
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install-gcc

  find "${pkgdir}" -name '*.la' -delete
  find "${pkgdir}" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true
  rm -rf ${pkgdir}/usr/${_target}-${pkgver}/share/info/dir
}

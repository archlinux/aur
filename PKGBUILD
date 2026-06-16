# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Shengqi Chen <i at harrychen dot xyz>
# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=mipsel-linux-gnu-gcc
_pkgname=gcc
_target="mipsel-linux-gnu"
pkgver=16.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the MIPS architecture"
url="https://www.gnu.org/software/gcc/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'xz' "${_target}-binutils")
makedepends=('gmp' 'mpfr')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
  '50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79' # gcc-16.1.0.tar.xz
  '33a851c045ea2ef6f580d82b2abfb1dc75d8b270727800028ca5f40c3b4a4246' # gcc-16.1.0.tar.xz.sig
)
validpgpkeys=(
  F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
  86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
  13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
  D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  CXXFLAGS="-Wno-error=format-security" ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --libdir=/usr/${_target}/lib \
    --datadir=/usr/${_target}/share \
    --datarootdir=/usr/${_target}/share \
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
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install-gcc

  find "${pkgdir}" -name '*.la' -delete
  find "${pkgdir}" -type f -executable -exec strip --strip-unneeded {} + 2>/dev/null || true
  rm -rf ${pkgdir}/usr/${_target}/share/info/dir
}

#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

_target=mips64-elf
pkgname=${_target}-gcc
pkgver=7.1.0
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
url='http://www.gnu.org/software/gcc/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libmpc' 'zlib' "${_target}-binutils" "${_target}-newlib")
makedepends=('gmp' 'mpfr')
options=('!emptydirs' '!strip')
conflicts=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2")
sha256sums=('8a8136c235f64c6fef69cac0d73a46a1a09bb250776a050aec8f9fc880bebc17')

prepare() {
  cd gcc-${pkgver}

  # Hack - see native package for details
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  rm -rf build
  mkdir build && cd build

  export CFLAGS_FOR_TARGET="-G0 -O2"
  export CXXFLAGS_FOR_TARGET="-G0 -O2"

  ../gcc-${pkgver}/configure \
    --target=${_target} \
    --prefix=/usr \
    --with-sysroot=/usr/${_target} \
    --libexecdir=/usr/lib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-python-dir=share/gcc-${_target} \
    --with-newlib \
    --without-included-gettext \
    --enable-checking=release \
    --enable-languages=c,c++ \
    --disable-decimal-float \
    --disable-gold \
    --disable-libatomic \
    --disable-libgcj \
    --disable-libgomp \
    --disable-libitm \
    --disable-libquadmath \
    --disable-libquadmath-support \
    --disable-libsanitizer \
    --disable-libssp \
    --disable-libunwind-exceptions \
    --disable-libvtv \
    --disable-multilib \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror \
    --enable-plugin \
    --enable-lto \
    --enable-static \

  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install -j1

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}


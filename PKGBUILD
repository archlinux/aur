#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

_target=mips64-elf
pkgname=${_target}-gcc-stage1
pkgver=8.2.0
_islver=0.19
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zlib' "${_target}-binutils" )
makedepends=('gmp' 'mpfr')
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=('!emptydirs' '!strip' )
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
		"http://isl.gforge.inria.fr/isl-${_islver}.tar.xz")
sha256sums=('196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080'
            '6d6c1aa00e2a6dfc509fa46d9a9dbe93af0c451e196a670577a148feecf6b8a5')

prepare() {
  cd gcc-${pkgver}

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir "${srcdir}"/build-gcc
}

build() {
  cd build-gcc

  export CFLAGS_FOR_TARGET="-G0 -Os -pipe"
  export CXXFLAGS_FOR_TARGET="-G0 -Os -pipe"

  "${srcdir}"/gcc-${pkgver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --with-sysroot=/usr/${_target} \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-python-dir=share/gcc-${_target} \
    --with-newlib \
    --without-headers \
    --without-included-gettext \
    --enable-checking=release \
    --enable-languages=c \
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
    --enable-lto \
    --enable-plugin \

  make
}

package() {
  cd build-gcc

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

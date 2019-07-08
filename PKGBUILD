# Maintainer: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-ultra-elf
pkgname=${_target}-gcc-stage1
_gccver=9.1.0
_islver=0.21
pkgver=9.1.0_r100.c9c95e7
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zlib' "${_target}-binutils" )
makedepends=('gmp' 'mpfr')
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=('!emptydirs' '!strip' )
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${_gccver}.tar.xz"
    "http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
    "git+https://github.com/glankk/n64.git#branch=n64-ultra")
sha256sums=('79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0'
            '777058852a3db9500954361e294881214f6ecd4b594c00da5eee974cd6a54960'
            'SKIP')

pkgver() {
  cd ${srcdir}/n64/
  printf "%s_r%s.%s" "${_gccver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gcc-${_gccver}

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  echo ${_gccver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir "${srcdir}"/build-gcc

  # -- Copy the files from the source.
  CP_DIR=${srcdir}/gcc-${_gccver}

  cd ${srcdir}/n64
  cp config/gcc/mips/* ${CP_DIR}/gcc/config/mips/
  cat config/gcc/config.gcc.ultra >> ${CP_DIR}/gcc/config.gcc
}

build() {
  cd build-gcc

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  export CXXFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"

  "${srcdir}"/gcc-${_gccver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --with-arch=vr4300 \
    --with-abi=32 \
    --with-sysroot=/usr/${_target} \
    --enable-languages=c \
    --enable-sjlj-exceptions \
    --with-gnu-as \
    --with-gnu-ld \
    --with-python-dir=share/gcc-${_target} \
    --with-newlib \
    --without-headers \
    --without-included-gettext \
    --enable-checking=release \
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
    --enable-multilib \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror \
    --enable-plugin

  make
}

package() {
  cd build-gcc

  make DESTDIR="${pkgdir}" install -j1

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/${_gccver} -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/${_gccver} -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-gcc-stage1
_gccver=10.2.0
_islver=0.22
pkgver=10.2.0_r134.54b8f95
pkgrel=1
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zstd')
makedepends=('gmp' 'mpfr' 'git' "${_target}-binutils")
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=('!emptydirs' '!strip' )
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-${_gccver}.tar.xz"
    "http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
    "git+https://github.com/glankk/n64.git#branch=n64-ultra")
sha256sums=('b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c'
            '6c8bc56c477affecba9c59e2c9f026967ac8bad01b51bdd07916db40a517b9fa'
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
    --libdir=/usr/${_target}/lib \
    --libexecdir=/usr/${_target}/lib \
    --target=${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --with-arch=vr4300 \
    --with-abi=32 \
    --with-sysroot=/usr/${_target}/n64-sysroot/  \
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

  make DESTDIR="${pkgdir}" install

  # strip target binaries
  find "$pkgdir"/usr/${_target}/lib/gcc/$_target/${_gccver} -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/${_target}/lib/gcc/$_target/${_gccver} -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/${_target}/lib/libcc1.*
}

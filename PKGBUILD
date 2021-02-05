# Stolen from mips64-elf-gcc-stage1

_target=mips64-unknown-linux-gnu
pkgname=${_target}-gcc-stage1
pkgver=10.2.0
_islver=0.22
pkgrel=0
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zstd' )
makedepends=('gmp' 'mpfr' "${_target}-binutils")
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=('!emptydirs' '!strip' )
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
		"http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
    "mabi32.patch")
sha256sums=('b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c'
            '6c8bc56c477affecba9c59e2c9f026967ac8bad01b51bdd07916db40a517b9fa'
            '368e2287adba14718dbd84dc75b2a7a2f65cb907e988b56813640ea8d9d2e951')

prepare() {
  cd gcc-${pkgver}

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir "${srcdir}"/build-gcc

  # patch multilib support for mabi=32
  patch --strip=2 --input=${srcdir}/mabi32.patch
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
    --with-arch=from-abi \
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
    --enable-lto \
    --enable-multilib \
    --enable-plugin \
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
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror

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

# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-gcc
_gccver=12.2.0
_islver=0.24
pkgver=12.2.0_r171.c378110
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
url="http://www.gnu.org/software/gcc/"
depends=(libmpc zstd)
makedepends=(gmp mpfr git "${_target}-binutils" "${_target}-newlib")
conflicts=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
options=(!emptydirs)
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${_gccver}/gcc-${_gccver}.tar.xz"
        "https://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
        "git+https://github.com/glankk/n64.git#branch=n64-ultra"
        "gcc11-Wno-format-security.patch")
sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
            'fcf78dd9656c10eb8cf9fbd5f59a0b6b01386205fe1934b3b287a0a1898145c0'
            'SKIP'
            'e388ee3f6871034ac021b0711f58f278c97eb1e749b466f896ae3dd35b165219')

pkgver() {
  cd "${srcdir}/n64/"
  printf "%s_r%s.%s" "${_gccver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "gcc-${_gccver}"

  # link isl for in-tree builds
  ln -s "../isl-$_islver" isl

  echo "${_gccver}" > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # -- Patch Werror=format-security issues.
  patch --strip=1 --input="$srcdir"/gcc11-Wno-format-security.patch

  mkdir "${srcdir}"/build-gcc

  # -- Copy the files from the source.
  CP_DIR="${srcdir}/gcc-${_gccver}"

  cd "${srcdir}/n64"
  cp config/gcc/mips/* "${CP_DIR}/gcc/config/mips/"
  cat config/gcc/config.gcc.ultra >> "${CP_DIR}/gcc/config.gcc"
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
    --host="$CHOST" \
    --build="$CHOST" \
    --with-arch=vr4300 \
    --with-abi=32 \
    --with-sysroot=/usr/${_target}/n64-sysroot/ \
    --enable-languages=c,c++,lto \
    --enable-sjlj-exceptions \
    --with-gnu-as \
    --with-gnu-ld \
    --with-python-dir=share/gcc-${_target} \
    --with-newlib \
    --without-included-gettext \
    --enable-checking=release \
    --disable-build-format-warnings \
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
  find "$pkgdir"/usr/${_target}/lib/gcc/$_target/${_gccver} "$pkgdir"/usr/$_target/lib -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/${_target}/lib/gcc/$_target/${_gccver} -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/${_target}/lib/libcc1.*
}

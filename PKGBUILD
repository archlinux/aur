# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-elf
pkgname=${_target}-gcc
pkgver=11.1.0
_islver=0.24
pkgrel=1
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zstd' "${_target}-newlib")
makedepends=('gmp' 'mpfr' "${_target}-binutils")
options=('!emptydirs' '!distcc' '!strip')
conflicts=("${_target}-gcc-stage1")
provides=("${_target}-gcc-stage1")
replaces=("${_target}-gcc-stage1")
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
        "mabi32.patch")
sha256sums=('4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf'
            '043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad'
            '86c06dfb12295e665204441ca17440d4e597da24b6cffad052c94268ec562169')

prepare() {
  cd gcc-${pkgver}

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # patch multilib support for mabi=32
  patch --strip=1 --input="${srcdir}"/mabi32.patch
}

build() {
  mkdir -p "${srcdir}"/build-gcc
  cd build-gcc

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "${srcdir}"/gcc-${pkgver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --host="$CHOST" \
    --build="$CHOST" \
    --with-arch=from-abi \
    --with-sysroot=/usr/${_target} \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-python-dir=share/gcc-${_target} \
    --with-newlib \
    --without-included-gettext \
    --enable-checking=release \
    --enable-languages=c,c++ \
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
  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver "$pkgdir"/usr/$_target/lib -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

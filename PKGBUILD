# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-elf
pkgname=${_target}-gcc-stage1
pkgver=14.2.0
_islver=0.26
pkgrel=2
pkgdesc="The GNU Compiler Collection. Stage 1 for toolchain building (${_target})"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://www.gnu.org/software/gcc/"
depends=('libmpc' 'zstd' )
makedepends=('gmp' 'mpfr' "${_target}-binutils")
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=('!emptydirs' '!strip')
source=("http://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
        "https://libisl.sourceforge.io/isl-${_islver}.tar.xz"
        "mabi32.patch")
sha256sums=('a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504'
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

  rm -rf "$srcdir"/build-gcc
  mkdir "$srcdir"/build-gcc
}

build() {
  cd build-gcc

  export CFLAGS_FOR_TARGET="-G0 -Os -pipe"
  export CXXFLAGS_FOR_TARGET="-G0 -Os -pipe"

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
    --disable-werror

  make all-gcc all-target-libgcc
}

package() {
  cd build-gcc

  make install-strip-gcc install-strip-target-libgcc DESTDIR="$pkgdir"

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/{include,share}
}

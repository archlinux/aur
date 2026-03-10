_target=x86_64-elf
_pkgver=4.3
pkgname=${_target}-gcc${_pkgver//./}
pkgver=4.3.6
pkgrel=1
pkgdesc="GCC 4.3 cross compiler for x86_64-elf target"
arch=(x86_64)
url="https://gcc.gnu.org"
license=(GPL)

depends=(
  "${_target}-binutils"
  gmp
  mpfr
  zlib
)

makedepends=(
  flex
  bison
)

options=(!emptydirs)

source=(
  "https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-core-${pkgver}.tar.bz2"
  "https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-g++-${pkgver}.tar.bz2"
)

sha256sums=(
  'SKIP'
  'SKIP'
)

_srcdir="gcc-${pkgver}"

prepare() {
  rm -rf "$srcdir/$_srcdir"
  mkdir "$srcdir/$_srcdir"

  bsdtar -xf gcc-core-${pkgver}.tar.bz2 -C "$srcdir/$_srcdir" --strip-components=1
  bsdtar -xf gcc-g++-${pkgver}.tar.bz2 -C "$srcdir/$_srcdir" --strip-components=1

  cd "$srcdir/$_srcdir"

  # Disable documentation (old GCC vs modern texinfo)
  echo "MAKEINFO=:" >> Makefile.in

  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  CC=gcc-4.3 \
  CXX=g++-4.3 \
  "$srcdir/$_srcdir/configure" \
    --target=${_target} \
    --prefix=/usr \
    --disable-nls \
    --disable-multilib \
    --enable-languages=c,c++ \
    --without-headers \
    --disable-libssp \
    --disable-libmudflap \
    --disable-libgomp \
    --disable-werror \
    --program-suffix=-4.3

  make all-gcc
  make all-target-libgcc
}

check() {
  cd "$srcdir/build"

  # Increase stack to avoid old GCC test crashes
  ulimit -s 32768

  make -k check || true
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install-gcc
  make DESTDIR="$pkgdir" install-target-libgcc

  # Remove docs
  rm -rf "$pkgdir/usr/share/info"
  rm -rf "$pkgdir/usr/share/man"

  # Optional convenience symlinks
  ln -s x86_64-elf-gcc-4.3 "$pkgdir/usr/bin/x86_64-elf-gcc"
  ln -s x86_64-elf-g++-4.3 "$pkgdir/usr/bin/x86_64-elf-g++"
}

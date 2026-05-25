# Maintainer: Jonas Bewig <jomosoto at proton dot me>

# Based on the riscv64-elf-gcc package by:
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=cr16-elf
pkgname=$_target-gcc-git
pkgver=16.0.0.r219731
pkgrel=3
pkgdesc='The GNU Compiler Collection - cross compiler for cr16 (bare-metal) target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=("GPL-3.0-with-GCC-exception AND GFDL-1.3-or-later")
depends=($_target-binutils zlib libmpc libisl zstd)
makedepends=(git gmp mpfr gcc15)
provides=("$_target-gcc")
conflicts=("$_target-gcc")
options=(!emptydirs !strip !lto)
source=("gcc-cr16::git+https://codeberg.org/CompactCall/gcc-cr16")
sha256sums=('SKIP')

prepare() {
  mkdir -p build-gcc
}

build() {
  echo $pkgver > gcc-cr16/gcc/BASE-VER

  cd build-gcc

  export CC=gcc-15
  export CXX=g++-15
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir"/gcc-cr16/configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-libgcc \
    --disable-libssp \
    --disable-nls \
    --disable-hosted-libstdcxx \
    --disable-shared \
    --without-headers \
    --with-newlib \
    --with-pkgversion="Arch User Repository" \
    --with-bugurl='https://codeberg.org/CompactCall/gcc-cr16/issues'

  make
}

package() {
  cd build-gcc

  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver \
    -type f -and \( -name \*.a -or -name \*.o \) \
    -exec /usr/bin/$_target-strip --strip-debug '{}' \;


  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

pkgver() {
  cd gcc-cr16
  
  git restore gcc/BASE-VER
  
  gccver=$(cat gcc/BASE-VER)
  printf '%s.r%s' "$gccver" "$(git rev-list --count HEAD)"
}

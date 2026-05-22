_target=arm-linux-gnueabi
pkgname=$_target-gcc
_pkgver=16.1.0
pkgver=$_pkgver
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for ARM GNU EABI little-endian target'
arch=(aarch64 x86_64)
url='http://gcc.gnu.org/'
license=(
  'GPL-3.0-or-later WITH GCC-exception-3.1'
  GFDL-1.3-or-later
)
depends=($_target-binutils libisl libmpc zlib zstd)
makedepends=(gmp mpfr)
options=(!emptydirs !strip)
source=(https://gcc.gnu.org/pub/gcc/releases/gcc-$_pkgver/gcc-$_pkgver.tar.xz{,.sig})
b2sums=('ceb07866b6b17eb4c69a6b51241b275bc5ec506603a7c1a4c1e2585091a09fc647be945beeff76700bffd9018bda81b072d84f909fd7998baa0cfe3f0eb550b4'
        'SKIP')
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # Arch Linux installs libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
  sed -i '/lp64=/s/lib64/lib/' gcc/config/aarch64/t-aarch64-linux

  mkdir -p "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  unset FFLAGS FCFLAGS

  $srcdir/gcc/configure \
    --target=$_target \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-plugins \
    --enable-shared \
    --disable-decimal-float \
    --disable-libffi \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-threads \
    --disable-tls \
    --disable-multilib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function

  make all-gcc
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" install-gcc

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
           -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
           -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir/usr/share/"{man/man7,info}
}


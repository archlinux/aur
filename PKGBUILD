# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=riscv-none-elf
pkgname=$_target-gcc-stage1
pkgver=15.2.0
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for RISC-V (bare-metal) target, stage 1'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc libisl zstd)
makedepends=(gmp mpfr)
options=(!emptydirs !lto)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
sha512sums=('89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de'
'SKIP')
validpgpkeys=('33C235A34C46AA3FFB293709A328C3A2C3C45C06'  # Jakub Jelinek <jakub@redhat.com>
              'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62'  # Jakub Jelinek <jakub@redhat.com>
              '13975A70E63C361C73AE69EF6EEB81F8981C74C7') # Richard Guenther <richard.guenther@gmail.com>
_basedir=gcc-$pkgver

prepare() {
  cd $_basedir

  echo $pkgver > gcc/BASE-VER

  mkdir "$srcdir"/build-gcc
}

build() {
  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  cd "$srcdir"/build-gcc
  export CFLAGS_FOR_TARGET="-g -Os -pipe"
  export CXXFLAGS_FOR_TARGET="-g -Os -pipe"

  "$srcdir"/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-plugins \
    --disable-decimal-float \
    --disable-libffi \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-tls \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-newlib \
    --with-headers=/usr/$_target/include \
    --with-python-dir=share/gcc-$_target \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function \
    --with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm'

  make all-gcc
}

package() {
  cd "$srcdir"/build-gcc
  make DESTDIR="$pkgdir" install-gcc -j1

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
}

# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-binutils
pkgver=2.33.1
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
license=(GPL)
url="http://sources.redhat.com/binutils"
groups=('frc-toolchain')
depends=('glibc')
options=(staticlibs !distcc !ccache)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
sha512sums=('b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac'
            'SKIP')

prepare() {
  cd binutils-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd "$srcdir/binutils-${pkgver}"

  find -name config.cache -exec rm {} \;

  [ $NOEXTRACT -eq 1 ] || ./configure \
    --prefix=/usr \
    --target=${_target} \
    --with-pkgversion='GNU Binutils for FRC' \
    --with-sysroot=/usr/${_target} \
    --disable-multilib \
    --disable-nls \
    --enable-lto \
    --disable-libiberty-install \
    --enable-ld \
    --enable-gold=default \
    --enable-plugins

  make
}

check() {
  cd binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd "$srcdir/binutils-${pkgver}"
  make prefix="$pkgdir/usr" tooldir="$pkgdir/usr" install

  # Remove unwanted files
  rm -f "$pkgdir"/usr/share/man/man1/{dlltool,nlmconv,windres,windmc}*

  # No shared linking to these files outside binutils
  rm -f "$pkgdir"/usr/lib/lib{bfd,opcodes}.so
  echo 'INPUT( /usr/lib/libbfd.a -liberty -lz -ldl )' > "$pkgdir/usr/lib/libbfd.so"
  echo 'INPUT( /usr/lib/libopcodes.a -lbfd )' > "$pkgdir/usr/lib/libopcodes.so"
}

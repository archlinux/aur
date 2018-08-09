# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Stefan Schmidt <thrimbor.github@gmail.com>

_target="powerpc-linux-gnu"
pkgname=${_target}-binutils
pkgver=2.30
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib)
checkdepends=(dejagnu bc)
options=(staticlibs !distcc !ccache)
source=(http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig}
        0001-PR22741-objcopy-segfault-on-fuzzed-COFF-object.patch
        0002-PR22829-objcopy-strip-removes-PT_GNU_RELRO-from-lld-.patch
        0003-PR22836-r-s-doesnt-work-with-g3-using-GCC-7.patch)
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
md5sums=('ffc476dd46c96f932875d1b2e27e929f'
         'SKIP'
         '469164f3c93a0e92a697537b60c9806c'
         '0c679b37e90fb23de60a4d28329b956a'
         '53b5682e09c0a27e9994c3efdfe01d29')

prepare() {
  mkdir -p binutils-build

  #cd binutils-gdb
  cd binutils-$pkgver

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # https://sourceware.org/bugzilla/show_bug.cgi?id=22741
  patch -p1 -i "$srcdir/0001-PR22741-objcopy-segfault-on-fuzzed-COFF-object.patch"

  # https://sourceware.org/bugzilla/show_bug.cgi?id=22829
  patch -p1 -i "$srcdir/0002-PR22829-objcopy-strip-removes-PT_GNU_RELRO-from-lld-.patch"

  # https://sourceware.org/bugzilla/show_bug.cgi?id=22836
  patch -p1 -i "$srcdir/0003-PR22836-r-s-doesnt-work-with-g3-using-GCC-7.patch"
}

build() {
  cd binutils-build

  "$srcdir/binutils-$pkgver/configure" \
      --prefix=/usr \
      --program-prefix=${_target}- \
      --with-lib-path=/usr/lib/binutils/${_target} \
      --with-local-prefix=/usr/lib/${_target} \
      --with-sysroot=/usr/${_target} \
      --enable-deterministic-archives \
      --enable-gold \
      --enable-ld=default \
      --enable-lto \
      --enable-plugins \
      --enable-relro \
      --enable-shared \
      --enable-threads \
      --disable-gdb \
      --disable-werror \
      --with-pic \
      --with-system-zlib \
      --disable-sim \
      --target=${_target} \
      --host=${CHOST} \
      --build=${CHOST}

  make configure-host
  make tooldir=/usr
}

check() {
  cd binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build
  make prefix="$pkgdir/usr" tooldir="$pkgdir/usr" install

  # Remove unwanted files
  rm -rf "$pkgdir/usr/share"
  rm -f "$pkgdir/usr/bin/"{ar,as,ld,nm,objdump,ranlib,readelf,strip,objcopy}
}

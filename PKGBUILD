# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-binutils
pkgver=2.29.0
_basever=2.29
pkgrel=1
_commit=dd9a28c0966d13924fbd1096a724ae334954d830
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=('glibc>=2.26' zlib)
options=(staticlibs !distcc !ccache)
source=(#git://sourceware.org/git/binutils-gdb.git#commit=${_commit}
        http://ftp.gnu.org/gnu/binutils/binutils-${_basever}.tar.bz2)
md5sums=('23733a26c8276edbb1168c9bee60e40e')

prepare() {
  mkdir -p binutils-build

  cd "binutils-$_basever"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-build

  "$srcdir/binutils-${_basever}/configure" \
      --prefix=/usr \
      --program-prefix=${_target}- \
      --with-lib-path=/usr/lib/binutils/${_target} \
      --with-local-prefix=/usr/lib/${_target} \
      --with-sysroot=/usr/${_target} \
      --enable-threads \
      --enable-shared \
      --enable-ld=default \
      --enable-gold \
      --enable-plugins \
      --enable-relro \
      --enable-deterministic-archives \
      --with-pic \
      --disable-werror \
      --disable-gdb \
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

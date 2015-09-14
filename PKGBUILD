# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-binutils
pkgver=2.25.1
pkgrel=3
_commit=2bd25930
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.22' 'zlib')
options=('staticlibs' '!distcc' '!ccache')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
source=(git://sourceware.org/git/binutils-gdb.git#commit=${_commit}
        binutils-e9c1bdad.patch)
md5sums=('SKIP'
         'eb3aceaab8ed26e06d505f82beb30f8f')

prepare() {
  cd ${srcdir}/binutils-gdb

  # https://sourceware.org/bugzilla/show_bug.cgi?id=16992
  patch -p1 -i ${srcdir}/binutils-e9c1bdad.patch

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/binutils-build
}

build() {
  cd ${srcdir}/binutils-build

  ${srcdir}/binutils-gdb/configure --prefix=/usr \
      --program-prefix=${_target}- \
      --with-lib-path=/usr/lib/binutils/${_target} \
      --with-local-prefix=/usr/lib/${_target} \
      --with-sysroot=/usr/${_target} \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --disable-nls \
      --enable-threads --enable-shared --with-pic \
      --enable-ld=default --enable-gold --enable-plugins \
      --enable-deterministic-archives \
      --disable-werror --disable-gdb --disable-sim

  make configure-host

  make tooldir=/usr
}

check() {
  cd ${srcdir}/binutils-build

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd ${srcdir}/binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Remove unwanted files
  rm -rf ${pkgdir}/usr/share
  rm -f ${pkgdir}/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip,objcopy}
}

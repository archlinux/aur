# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Felipe Balbi <felipe@balbi.sh>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-binutils
pkgver=2.38
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib elfutils)
#makedepends=('elfutils')
options=(staticlibs !distcc !ccache)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
#source=(https://ftpmirror.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=('e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024'
            'SKIP')
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)

prepare() {
  mkdir -p binutils-build

  #cd binutils-gdb
  cd binutils-$pkgver

  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  #patch -Np1 -i ../binutils-cb5f6a3e146cc70bc2d864989386df80acec5d3e.patch
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
      --enable-threads \
      --disable-gdb \
      --disable-werror \
      --with-debuginfod \
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
  make DESTDIR="$pkgdir" install

  # Remove unwanted files
  rm -rf "$pkgdir/usr/share"
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib"
  rm -f "$pkgdir/usr/bin/"{ar,as,ld,nm,objdump,ranlib,readelf,strip,objcopy}
}

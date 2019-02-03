# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname=${_target}-binutils
pkgver=2.31.1
pkgrel=4
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib)
checkdepends=(dejagnu bc)
options=(staticlibs !distcc !ccache)
source=(http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig}
        0001-PR23428-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
        0002-PR23460-Close-resource-leaks-in-the-BFD-library-s-plugin-han.patch
        0003-PR23460-Add-a-testcase-for-PR-binutils-23460.patch
        0004-PR23486-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED-x86_64.patch
        0005-PR23486-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
        0006-PR23428-x86-Properly-add-X86_ISA_1_NEEDED-property.patch
        0007-PR23919-Handle-ELF-compressed-header-alignment.patch
        0008-PR23919-gold-Get-alignment-of-uncompressed-section.patch
)
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
md5sums=('5b7c9d4ce96f507d95c1b9a255e52418'
         'SKIP'
         'f2d4f2aee9ec2e25210eb132acdcf1d9'
         '496e7e2d71fe558b3b85cdc27fb4638e'
         'dd2284134542efe8e38137f5c829a371'
         '5e4aecddbea729fd045d001e8e8db14e'
         '02247a5f1c06f8a9ade689b7e68629ce'
         '2764b8760bdc8d5c20698202d22b7fcf'
         '5db54b24fb9de56d66111f63aea3b809'
         '201036d5806b7b037eb53bf796219525')

prepare() {
  mkdir -p binutils-build

  #cd binutils-gdb
  cd binutils-$pkgver

  # https://sourceware.org/bugzilla/show_bug.cgi?id=23428
  # https://sourceware.org/bugzilla/show_bug.cgi?id=23486
  patch -Np1 -i ../0001-PR23428-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
  patch -Np1 -i ../0004-PR23486-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED-x86_64.patch
  patch -Np1 -i ../0005-PR23486-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
  patch -Np1 -i ../0006-PR23428-x86-Properly-add-X86_ISA_1_NEEDED-property.patch

  # https://sourceware.org/bugzilla/show_bug.cgi?id=23460
  patch -Np1 -i ../0002-PR23460-Close-resource-leaks-in-the-BFD-library-s-plugin-han.patch
  patch -Np1 -i ../0003-PR23460-Add-a-testcase-for-PR-binutils-23460.patch

  # FS#61151
  # https://sourceware.org/bugzilla/show_bug.cgi?id=23919
  patch -Np1 -i ../0007-PR23919-Handle-ELF-compressed-header-alignment.patch
  patch -Np1 -i ../0008-PR23919-gold-Get-alignment-of-uncompressed-section.patch

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
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

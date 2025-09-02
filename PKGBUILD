# Maintainer: Mariano Street <mctpyt at gmail dot com>

_target=z80-elf
pkgname=$_target-binutils
pkgver=2.45
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Z80 (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib elfutils)
makedepends=(elfutils)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=(c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2
            987526135ba5e4c0269b397525d613ff9c737ec0cadf176e6b20d87ac6f7c073)

validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)  # Nick Clifton <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver

  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  cd binutils-$pkgver

  ./configure \
    --target=$_target \
    --with-sysroot=/usr/$_target \
    --prefix=/usr \
    --enable-deterministic-archives \
    --enable-lto \
    --enable-plugins \
    --enable-relro \
    --enable-threads \
    --disable-nls \
    --with-system-zlib

  make
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make -k LDFLAGS= check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info

  # Remove .so that conflict with host version
  rm -r "$pkgdir"/usr/lib
}

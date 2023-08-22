# Maintainer: Mariano Street <mctpyt at gmail dot com>

_target=z80-elf
pkgname=$_target-binutils
pkgver=2.41
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Z80 (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(glibc zlib elfutils)
makedepends=(elfutils)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha256sums=(ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450
            6f72b25f95614ecbfd050ffdae628e00e90aec9073e30d8ab366e4fc9d1e9e2d)

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

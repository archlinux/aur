_target=arm-linux-gnueabi
pkgname=$_target-binutils
pkgver=2.47
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the ARM GNU EABI little-endian target'
arch=(aarch64 armv7h x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3-only FSFAP)
depends=(glibc libelf zlib zstd)
source=(https://ftpmirror.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
b2sums=('1559a07fc21b145494e418b32aefac1a6e83c0bf56d7290c03b2071a166356cc87a5b079e1560d1210a005b97efa01ad51019121a38f64930f8982eaf4f61683'
        'SKIP')
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F) # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd "binutils-$pkgver"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # Turn off development mode (-Werror, gas run-time checks, date in sonames)
  sed -i '/^development=/s/true/false/' bfd/development.sh
}

build() {
  cd "binutils-$pkgver"

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --disable-gprofng \
              --disable-multilib \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-gold \
              --enable-ld=default \
              --enable-plugins \
              --enable-deterministic-archives \
              --enable-new-dtags

  make
}

check() {
  cd "binutils-$pkgver"

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd "binutils-$pkgver"

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}

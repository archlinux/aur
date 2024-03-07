# Maintainer: Maxr1998 <aur@maxr1998.de>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-binutils
pkgver=2.42
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32bit and 64bit RISC-V'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib' 'binutils')
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800')

prepare() {
  cd binutils-$pkgver
  sed -i '/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/' libiberty/configure
}

build() {
  cd binutils-$pkgver

  unset CPPFLAGS

  ./configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --disable-nls \
    --enable-multilib \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins \
    --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info

  # Remove libraries that conflict with host version - https://bugs.archlinux.org/task/69682
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  rmdir "$pkgdir"/usr/lib/bfd-plugins
  rmdir "$pkgdir"/usr/lib
}

# vim: set ts=2 sw=2 et:

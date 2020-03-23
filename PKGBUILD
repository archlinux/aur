# Maintainer: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-binutils
pkgver=2.34
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32bit and 64bit RISC-V'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('f00b0e8803dc9bab1e2165bd568528135be734df3fabf8d0161828cd56028952')

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
}

# vim: set ts=2 sw=2 et:

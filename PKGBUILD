# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-gnu
pkgname=$_target-binutils
pkgver=2.31
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32bit and 64bit RISC-V'
arch=('x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib')
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha512sums=('3448a71c42d790569c1159c1042aa520b2d8ac8af7506fb1f2a4199dfb13b39f1c2271a5cb3a643d10c7d8a388a73f190e90503d4793a016da7893473aa1c635')

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
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
  make LDFLAGS="" -k check
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}

# vim: set ts=2 sw=2 et:

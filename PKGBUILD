# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

pkgname=riscv-openocd-git
pkgver=v20180629.r2363.g9906763b8
pkgrel=1
pkgdesc='Fork of OpenOCD that has RISC-V support'
arch=('x86_64')
url='https://github.com/riscv/riscv-openocd'
license=('GPL')
depends=('libftdi' 'hidapi')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool')
source=("$pkgname::git+https://github.com/riscv/riscv-openocd.git#branch=riscv")
sha1sums=('SKIP')
pkgdatadir="/usr/share/riscv-openocd"

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"

  # rename info file so we don't clash with a normal openocd install
  sed -i 's/openocd.info/riscv-openocd.info/' doc/openocd.texi

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-prefix=riscv- \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="$pkgdatadir"
}

package() {
  cd "$srcdir/$pkgname"
  make pkgdatadir="$pkgdatadir" DESTDIR="$pkgdir" install
}


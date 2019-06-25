# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

pkgname=riscv-openocd-git
pkgver=1
pkgrel=1
pkgdesc='Fork of OpenOCD that has RISC-V support'
arch=('x86_64')
url='https://github.com/riscv/riscv-openocd'
license=('GPL')
depends=('libftdi' 'hidapi')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool')
source=("$pkgname::git+https://github.com/riscv/riscv-openocd.git#branch=riscv")
sha1sums=('SKIP')

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

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-prefix=riscv64-linux-gnu \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="/usr/share/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  make pkgdatadir="/usr/riscv64-linux-gnu/share/$pkgname" DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/share/info"
}


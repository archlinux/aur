# Maintainer: Gökçe Aydos <aydos.de>
# Contributor: Patrick Oppenlander <patrick.oppenlander@gmail.com>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

pkgname=openocd_riscv-git
pkgver=v0.9.0.r4033.g058dfa50d
pkgrel=1
pkgdesc='Fork of OpenOCD that has RISC-V support (by SpinalHDL for jtag_tcp support used by VexRiscv)'
arch=('x86_64')
url='https://github.com/SpinalHDL/openocd_riscv-git'
license=('GPL')
depends=('libftdi' 'hidapi')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool')
source=("$pkgname::git+https://github.com/SpinalHDL/openocd_riscv.git")
sha1sums=('SKIP')
pkgdatadir="/usr/share/openocd_riscv"

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
  sed -i 's/openocd.info/openocd_riscv.info/' doc/openocd.texi

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-prefix=shdl-riscv- \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="$pkgdatadir"
}

package() {
  cd "$srcdir/$pkgname"
  make pkgdatadir="$pkgdatadir" DESTDIR="$pkgdir" install
}


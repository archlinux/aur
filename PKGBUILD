# Maintainer: Emil Renner Berthing <aur@esmil.dk>

pkgname=riscv-openocd
pkgver=20170818.23
pkgrel=1
pkgdesc='Fork of OpenOCD that has RISC-V support'
arch=('i686' 'x86_64')
url='https://github.com/riscv/riscv-openocd'
license=('GPL')
depends=('libftdi' 'hidapi')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool')
source=("$pkgname::git+https://github.com/riscv/riscv-openocd.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(git describe --tags)"
  ver="${ver%-*}"
  ver="${ver#v}"
  echo "${ver/-/.}"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-prefix=${pkgname%openocd} \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="/usr/share/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  make pkgdatadir="/usr/share/$pkgname" DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/share/info"
}

# vim: set ts=2 sw=2 et:

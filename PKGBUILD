# Maintainer: flashs <mafol002 at stud dot fh-dortmund dot de>
pkgname=openocd-zephyr-git
pkgver=0.10.0.1393
pkgrel=1
pkgdesc='Fork of OpenOCD with support for Zephyr RTOS'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/zephyrproject-rtos/openocd'
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
source=("$pkgname::git+https://github.com/zephyrproject-rtos/openocd.git")
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
    --program-suffix="-zephyr" \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="/usr/share/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  make pkgdatadir="/usr/share/$pkgname" DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/share/info"
}

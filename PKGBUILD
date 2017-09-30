# Maintainer: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: Emil Renner Berthing <aur@esmil.dk>
# Contributor: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=esp32-openocd
pkgver=0.10.0.dev.g77b10c51
pkgrel=1
pkgdesc='Fork of OpenOCD that has ESP32 support'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/espressif/openocd-esp32'
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)

source=(
    "$pkgname::git+https://github.com/espressif/openocd-esp32.git"
    )
md5sums=(
    'SKIP'
    )
sha1sums=(
    'SKIP'
    )

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(cat configure.ac | grep AC_INIT | cut -d'[' -f3 | cut -d']' -f1)"
  local rev="$(./guess-rev.sh)"
  echo "${ver/-/.}${rev/-/.}"
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

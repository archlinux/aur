# Maintainer: Kurt McAlpine <kurt at linux dot com>
# Contributor: Michael Zimmermann <sigmaepsilon92@gmail.com>
# Contributor: Emil Renner Berthing <aur@esmil.dk>
# Contributor: yhfudev <yhfudev ta gmail dot com>
# Contributor: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=openocd-esp32
pkgver=v0.11.0_esp32_20220706
pkgrel=1
pkgdesc='Fork of OpenOCD that has ESP32 support'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/espressif/openocd-esp32'
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi' )
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)

source=(
    "$pkgname-$pkgver::git+https://github.com/espressif/openocd-esp32.git#tag=${pkgver//_/-}"
    )
md5sums=(
    'SKIP'
    )
sha1sums=(
    'SKIP'
    )

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  local ver="$(cat configure.ac | grep AC_INIT | cut -d'[' -f3 | cut -d']' -f1)"
  local rev="$(./guess-rev.sh)"
  echo "${pkgver//-/_}"
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  git submodule init
  git submodule update
  ac_init_version=$(echo $pkgver | cut -d'_' -f1)
  sed -i 's/AC_INIT(\[openocd\], \[ \],/AC_INIT([openocd], ['"$ac_init_version"'],/g' configure.ac
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --program-prefix=${pkgname%openocd} \
    --disable-werror \
    --with-gnu-ld

  make pkgdatadir="/usr/share/$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make pkgdatadir="/usr/share/$pkgname" DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/share/info"
}

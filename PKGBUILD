# Maintainer: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

# Build order: avr-binutils -> avr-gcc -> avr-libc

pkgname=avr-libc-atmel
pkgver=2.0.0
_atmelver=3.5.4
pkgrel=1
pkgdesc='The C runtime library for the AVR family of microcontrollers (from Atmel)'
arch=("i686" "x86_64")
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
license=("BSD")
depends=("avr-gcc")
provides=("avr-libc")
conflicts=("avr-libc")
options=(!strip) # it corrupts avr libraries
_url_base="http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}"
source=("${_url_base}/avr-libc.tar.bz2" "${_url_base}/avr8-headers.zip")
sha1sums=('eb77adb21f758635f4927a3f72f443b04cb83f0f'
          'fd8b7e7560732d4d55f0b5fc73affd6ea889de8d')

prepare() {
  cd $srcdir

  # headers in avr8-headers are newer
  cp -f avr/io[0-9a-zA-Z]*.h libc/avr-libc/include/avr/
}

build() {
  cd $srcdir/libc/avr-libc
  ./bootstrap
  ./configure \
      --build=$(./config.guess) \
      --host=avr \
      --prefix=/usr \
      --enable-device-lib

  make
}

package() {
  cd ${srcdir}/libc/avr-libc

  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Matthias Bauch <matthias.bauch@gmail.com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

pkgname=openocd
pkgver=0.10.0
epoch=1
pkgrel=1
pkgdesc='Debugging, in-system programming and boundary-scan testing for embedded target devices'
arch=('x86_64')
url='http://openocd.org/'
license=('GPL')
depends=('libftdi' 'libftdi-compat' 'libusb' 'libusb-compat' 'hidapi')
options=(!strip)
_features=(amtjtagaccel armjtagew buspirate ftdi gw16012 jlink oocd_trace
 opendous osbdm parport presto_libftdi remote-bitbang rlink stlink ti-icdi ulink usbprog vsllink
 aice cmsis-dap dummy jtag_vpi openjtag_ftdi usb-blaster-2 usb_blaster_libftdi)
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver/_/-}.tar.bz2)
sha256sums=('7312e7d680752ac088b8b8f2b5ba3ff0d30e0a78139531847be4b75c101316ae')

prepare() {
  cd $pkgname-${pkgver/_/-}
  sed -i 's|ftdi_new();|(void*)12345;|g' configure{,.ac}
}

build() {
  cd $pkgname-${pkgver/_/-}
  libtoolize
  autoreconf
  ./configure --prefix=/usr ${_features[@]/#/--enable-} --disable-werror
  make
}

package() {
  cd $pkgname-${pkgver/_/-}
  make DESTDIR="$pkgdir" install
  (cd "$pkgdir"/usr/share/openocd/scripts/target && mv 1986*.cfg 1986be1t.cfg)
}

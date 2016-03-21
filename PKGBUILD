# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=('libudev0')
pkgver=182
pkgrel=3
pkgdesc="Dynamic library to access udev device information, legacy libudev.so.0."
url="https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc')
makedepends=('kmod' 'usbutils' 'gperf')
source=("https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev-182.tar.xz")
sha256sums=('adb8892f3b8e4b7163703ed4a545774721a3d55a1062de001f08c477c03d97ab')

prepare() {
  cd "${srcdir}/udev-${pkgver}"
  autoreconf -vfi

  # Event codes have been moved out of input.h
  sed -i 's:input.h:input-event-codes.h:' Makefile.in
  # stdin.h is needed for uint32_t and uint8_t typedefs
  sed -i '20a#include <stdint.h>' src/mtd_probe/mtd_probe.h
}

build() {
  cd "${srcdir}/udev-${pkgver}"
  ./configure \
    --disable-gudev \
    --disable-introspection \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/udev
  make LIBS="-lrt"
}

package() {
  cd "${srcdir}/udev-${pkgver}"
  install -Dm755 .libs/libudev.so.0.13.1 "${pkgdir}/usr/lib/libudev.so.0.13.1"
  ln -s "/usr/lib/libudev.so.0.13.1" "${pkgdir}/usr/lib/libudev.so.0"
}

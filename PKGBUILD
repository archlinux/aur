# Maintainer: graysky <therealgraysky AT proton DOT me>
#
# C library providing GPIO/I2C/SPI/serial/PWM access on Raspberry Pi and
# other Linux SBCs. Successor to pigpio (which does not support the Pi 5's
# RP1 GPIO controller). Required by python-lgpio, which python-pinsource
# (and therefore raspisump) depends on.

pkgname=liblgpio
pkgver=0.2.2
pkgrel=1
pkgdesc="Linux SBC GPIO/I2C/SPI/serial access library"
arch=(x86_64 aarch64 armv7h)
url="http://abyz.me.uk/lg/py_lgpio.html"
license=('custom:unknown')
source=("lg-$pkgver.tar.gz::https://github.com/joan2937/lg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b08d8569d6dc8fa91a42ba1e37f620fdcb19d6bf2330e4b7d7301431ddbe124c')

build() {
  cd "lg-$pkgver"
  # incompatible-function-pointer assignments (used throughout lgGpio.c's
  # callback registration) from a warning into a hard error under the
  # newer default C standard. -std=gnu17 restores the old, permissive
  # behavior; this is a compiler pickiness issue, not a real bug class
  # worth patching around.
  export CFLAGS+=" -std=gnu17"
  # Build only the C libraries and the rgpio remote-GPIO daemon/shell.
  # (Skip the python2/rgpio doc targets bundled in "all" - the Python
  # bindings are packaged separately as python-lgpio.)
  make liblgpio.so librgpio.so rgpiod rgs
}

package() {
  cd "lg-$pkgver"

  install -Dm644 lgpio.h "$pkgdir/usr/include/lgpio.h"
  install -Dm644 rgpio.h "$pkgdir/usr/include/rgpio.h"

  install -Dm755 liblgpio.so.1 "$pkgdir/usr/lib/liblgpio.so.1"
  install -Dm755 librgpio.so.1 "$pkgdir/usr/lib/librgpio.so.1"
  ln -s liblgpio.so.1 "$pkgdir/usr/lib/liblgpio.so"
  ln -s librgpio.so.1 "$pkgdir/usr/lib/librgpio.so"

  install -Dm755 rgpiod "$pkgdir/usr/bin/rgpiod"
  install -Dm755 rgs "$pkgdir/usr/bin/rgs"

  install -Dm644 rgpiod.1 "$pkgdir/usr/share/man/man1/rgpiod.1"
  install -Dm644 rgs.1 "$pkgdir/usr/share/man/man1/rgs.1"
  install -Dm644 lgpio.3 "$pkgdir/usr/share/man/man3/lgpio.3"
  install -Dm644 rgpio.3 "$pkgdir/usr/share/man/man3/rgpio.3"

  install -Dm644 UNLICENCE "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
}

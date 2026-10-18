# Maintainer: Joel Tony <github at jaytau dot com>

pkgname=samsung-tvcam-fwloader
_commit=31588de7a27bfa670df82adeed568b47af6466ef
pkgver=0.20250519
pkgrel=1
pkgdesc='Firmware loader for Samsung TV cameras (VG-STC2000/3000/4000/5000) so they work as UVC webcams'
arch=('x86_64')
url='https://github.com/ondrej-zary/samsung-tvcam-fwloader'
# Loader is GPL-3.0; the bundled firmware blobs are Samsung's, redistributed upstream without a license
license=('GPL-3.0-only' 'LicenseRef-Samsung-firmware')
depends=('glibc' 'libusb' 'systemd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('79f502a13d0349a756c26ae5872d60adf24bc0737f7fa147b4990739c204a2c5')

build() {
  cd "$pkgname-$_commit"
  gcc $CPPFLAGS $CFLAGS -Wall -Wextra $LDFLAGS samsung_tvcam_fwload.c \
    $(pkg-config --cflags --libs libusb-1.0) -o samsung_tvcam_fwload
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 samsung_tvcam_fwload -t "$pkgdir/usr/lib/udev/"
  install -Dm644 raptor_firmware.img FalconFW.bin FalconPlus_FW.bin Heron_Ext_FW.bin \
    -t "$pkgdir/usr/lib/firmware/samsung-tvcam/"
  install -Dm644 40-samsung-tvcam-fwloader.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

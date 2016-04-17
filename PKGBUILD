# Maintainer: Yang <positivcheg94@gmail.com>
pkgname=librealsense
pkgver=0.9.1
pkgrel=1
pkgdesc="Librealsense is a cross-platform library (Linux, OSX, Windows) for capturing data from the Intel RealSense F200, SR300 and R200 cameras"
arch=(any)
url="https://github.com/IntelRealSense/librealsense"
license=('Apache')
makedepends=()
depends=('glfw>=3' 'libusb')
optdepends=('qtcreator')
changelog=''
source=("https://github.com/IntelRealSense/librealsense/archive/v${pkgver}.tar.gz")
md5sums=('f2f2bad22f3cffb8f1bb3f509a90f3fb')

udev_rules="etc/udev/rules.d/99-realsense-libusb.rules"

build() {
  cd "$pkgname-$pkgver"
  make BACKEND=LIBUVC
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  mkdir -p $pkgdir/usr/include/$pkgname
  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/etc/udev/rules.d/
  cp -r lib/* $pkgdir/usr/lib/
  cp -r include/$pkgname/* $pkgdir/usr/include/$pkgname
  getent group realsense || groupadd realsense
echo "SUBSYSTEMS==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"8086\", ATTRS{idProduct}==\"0a80\", MODE=\"0666\", GROUP=\"realsense\"" > $pkgdir/$udev_rules
echo "SUBSYSTEMS==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"8086\", ATTRS{idProduct}==\"0a66\", MODE=\"0666\", GROUP=\"realsense\"" >>$pkgdir/$udev_rules
echo "SUBSYSTEMS==\"usb\", ENV{DEVTYPE}==\"usb_device\", ATTRS{idVendor}==\"8086\", ATTRS{idProduct}==\"0aa5\", MODE=\"0666\", GROUP=\"realsense\"" >>$pkgdir/$udev_rules
}

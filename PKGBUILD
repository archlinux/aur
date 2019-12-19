# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>

pkgbase=cp210x
pkgname=(cp210x cp210x-dkms)
pkgver=2019.7.12
pkgrel=3
pkgdesc='Silicon Labs CP210x RS232 serial adaptor driver'
url='https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers'
arch=("$(uname -m)")
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
source=("https://www.silabs.com/documents/login/software/Linux_3.x.x_4.x.x_VCP_Driver_Source.zip"
        dkms.conf)
sha256sums=('7d624cd66ee610fd9c6598793534ed593ac1309b3d3b3699c101d921ad9ccd7c'
            '62da72a3f8f9566326168a759cb5cc54b8c39aeb6594e1b4229774868c7eb3d2')

build() {
  make KVERSION="$(</usr/src/linux/version)"
}

package_cp210x() {
  install -Dt "$pkgdir/usr/lib/modules/$(</usr/src/linux/version)/extramodules" -m644 *.ko
  find "$pkgdir" -name '*.ko' -exec xz {} +

  echo cp210x | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/cp210x.conf"

  mkdir -p "$pkgdir/usr/share/cp210x"
}

package_cp210x-dkms() {
  arch=("any")
  depends=(dkms)
  provides=("cp210x=$pkgver-$pkgrel")
  conflicts=(cp210x)

  install -Dt "$pkgdir/usr/src/$pkgbase-$pkgver" -m644 Makefile cp210x.c dkms.conf

  echo cp210x | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/cp210x.conf"
}

# vim:set ts=2 sw=2 et:

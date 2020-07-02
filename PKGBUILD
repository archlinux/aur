# Maintainer: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=cp210x
pkgver=2019.7.12
pkgrel=6
pkgdesc='Silicon Labs CP210x RS232 serial adaptor driver'
url='https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers'
arch=("$(uname -m)")
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
source=("https://www.silabs.com/documents/login/software/Linux_3.x.x_4.x.x_VCP_Driver_Source.zip"
        override-kversion.patch)
sha256sums=('7d624cd66ee610fd9c6598793534ed593ac1309b3d3b3699c101d921ad9ccd7c'
            '4dfcb1fff04a30ccd4b1b6f8d7bba0aada7712aac2b6f3deff792d98f98f651f')

prepare() {
  patch Makefile < override-kversion.patch
}

package() {
  make KVERSION="$(</usr/src/linux/version)"
  install -Dt "$pkgdir/usr/lib/modules/$(</usr/src/linux/version)/extramodules" -m644 *.ko
  find "$pkgdir" -name '*.ko' -exec xz {} +

  echo cp210x | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/cp210x.conf"

  mkdir -p "$pkgdir/usr/share/cp210x"
}

pkgname=hailo-pci
pkgver=4.17.1
pkgrel=1
pkgdesc="Hailo AI Accelerator PCIe driver"
arch=('aarch64' 'x86_64')
url="https://hailo.ai/"
license=('GPL-2.0')
makedepends=('cmake' 'gcc')
provides=('hailo_pci.ko')
source=("https://github.com/hailo-ai/hailort-drivers/archive/v${pkgver}.tar.gz")
sha256sums=('9aa62f56a9d4a336fcd642e392840f2f3899d9c0414e38f5317c04dfc0d8bfa1')

build() {
  cd hailort-drivers-${pkgver}

  ./download_firmware.sh

  cd linux/pcie
  make all
}

package() {
  cd hailort-drivers-${pkgver}

  install -Dvm 644 hailo8_fw.${pkgver}.bin ${pkgdir}/usr/lib/firmware/hailo/hailo8_fw.bin
  install -Dvm 644 linux/pcie/build/release/$(uname -m)/hailo_pci.ko \
    ${pkgdir}/usr/lib/modules/$(uname -r)/kernel/extra/hailo_pci.ko
}

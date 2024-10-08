pkgname=hailo-pci
pkgver=4.19.0
pkgrel=1
pkgdesc="Hailo AI accelerator PCIe driver and matching firmware"
arch=('aarch64' 'x86_64')
url="https://hailo.ai/"
license=('GPL-2.0')
makedepends=('gcc')
provides=('hailo8_fw.bin' 'hailo_pci.ko')
source=("https://github.com/hailo-ai/hailort-drivers/archive/v${pkgver}.tar.gz")
sha256sums=('0c687d229968ba3092ee214ed45be8ccaedf005f8a2c4fb8f26c439608c960e9')

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

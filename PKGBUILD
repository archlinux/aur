pkgname=hailo-pci
pkgver=4.21.0
pkgrel=2
pkgdesc="Hailo AI accelerator PCIe driver and matching firmware"
arch=('aarch64' 'x86_64')
url="https://hailo.ai/"
license=('GPL-2.0-only')
makedepends=('gcc')
provides=('hailo8_fw.bin' 'hailo_pci.ko')
source=("https://github.com/hailo-ai/hailort-drivers/archive/v${pkgver}.tar.gz")
sha256sums=('624468126c1e5609475389271b3d2878cb6e7e40df9e85bad95be464a3e11be3')

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

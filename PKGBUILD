# Maintainer: 7Ji <pugokughin@gmail.com>

_commit='0b32ed16bfd45f979cd1e20c1efb1de6abbb7d64'

pkgname=linux-firmware-amlogic-ophub
pkgver=20230405
pkgrel=1
pkgdesc="Firmware files for Linux - for AArch64 Amlogic platform, complete set, collected by ophub"
arch=('aarch64')
url="https://github.com/ophub/firmware"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware')
provides=("linux-firmware=${pkgver}")
options=(!strip)
source=(
  "firmware-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
)

sha256sums=(
  'f1c3cb68df79c1de943cf4bcd88b9634ff8ced82265ae021ee87dbf0e6134881'
)

package() {
  install -d -m 755 "${pkgdir}"/usr/lib
  cp -rva "${srcdir}/firmware-${_commit}/firmware" "${pkgdir}/usr/lib/"
  
  # Optimize wifi/bluetooth module, adapted from https://github.com/ophub/amlogic-s9xxx-armbian/blob/d324aad263106aa218f9ada5c01b1ca6f285c121/rebuild#L803
  pushd "${pkgdir}/usr/lib/firmware/brcm"

  # gtking/gtking pro is bcm4356 wifi/bluetooth, wifi5 module AP6356S
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:00/" "brcmfmac4356-sdio.txt" >"brcmfmac4356-sdio.azw,gtking.txt"
  # gtking/gtking pro is bcm4356 wifi/bluetooth, wifi6 module AP6275S
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:01/" "brcmfmac4375-sdio.txt" >"brcmfmac4375-sdio.azw,gtking.txt"
  # Phicomm N1 is bcm43455 wifi/bluetooth
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:02/" "brcmfmac43455-sdio.txt" >"brcmfmac43455-sdio.phicomm,n1.txt"
  # MXQ Pro+ is AP6330(bcm4330) wifi/bluetooth
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:03/" "brcmfmac4330-sdio.txt" >"brcmfmac4330-sdio.crocon,mxq-pro-plus.txt"
  # HK1 Box & H96 Max X3 is bcm54339 wifi/bluetooth
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:04/" "brcmfmac4339-sdio.ZP.txt" >"brcmfmac4339-sdio.amlogic,sm1.txt"
  # old ugoos x3 is bcm43455 wifi/bluetooth
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:05/" "brcmfmac43455-sdio.txt" >"brcmfmac43455-sdio.amlogic,sm1.txt"
  # new ugoos x3 is brm43456
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:06/" "brcmfmac43456-sdio.txt" >"brcmfmac43456-sdio.amlogic,sm1.txt"
  # x96max plus v5.1 (ip1001m phy) adopts am7256 (brcm4354)
  sed -e "s/macaddr=.*/macaddr=${random_macaddr}:07/" "brcmfmac4354-sdio.txt" >"brcmfmac4354-sdio.amlogic,sm1.txt"

  popd
}
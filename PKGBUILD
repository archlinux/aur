# Maintainer: Yannick Inizan <inizan[dot]yannick[at]gmail[dot}com>

pkgname=mt7610u_wifi_sta-alt
pkgver=1
pkgrel=3
# To get an overview of witch WiFi dongle has this chipset refer to https://wikidevi.com/wiki/MediaTek_MT7610U
pkgdesc="Kernel module for MediaTek MT7610U chipset featured in TP-Link Archer T2U and T2UH, TP-Link TL-WDN5200, ASUS USB-AC50, ASUS USB-AC51, Comcast Xfinity KXW02AAA, D-Link DWA-171 rev B1 and more"
arch=('any')
license=('GPL2')
url="https://github.com/BZHDeveloper/mt7610u_wifi_sta_v3002_dpo_20130916"
conflicts=('mt7610u_wifi_sta')
depends=('linux')
makedepends=('git' 'linux-headers')
install="depmod.install"
source=("mt7610u_wifi_sta-alt"::"git+https://github.com/BZHDeveloper/mt7610u_wifi_sta_v3002_dpo_20130916.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  major=$(uname -r | cut -d'.' -f1)
  minor=$(uname -r | cut -d'.' -f2)
  linuxver="${major}.${minor}"
  if [ $(echo "${linuxver} < 4.14" | bc) -eq 1 ]; then
    linuxver="4.10"
  elif [ $(echo "${linuxver} >= 4.15" | bc) -eq 1 ]; then
    linuxver="4.15"
  fi
  git checkout "linux-${linuxver}"
	make -C "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}/${pkgname}"
  rm -rf "${pkgdir}/etc/Wireless/RT2870STA"
  mkdir -p "${pkgdir}/etc/Wireless/RT2870STA"
  mkdir -p "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux"
	install -m 644 -t "${pkgdir}/etc/Wireless/RT2870STA" RT2870STA.dat
	install -m 644 -t "${pkgdir}/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/os/linux" os/linux/*.ko
}

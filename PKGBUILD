# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=linux-wifi-hotspot
pkgver=1.9
pkgrel=3
pkgdesc='Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)'
arch=('x86_64')
url='https://github.com/lakinduakash/linux-wifi-hotspot'
license=('BSD-2-Clause')
depends=('hostapd'
         'iw'
         'gtk3'
         'libx11'
         'gksu'
         'procps-ng'
         'bash'
         'util-linux'
         'dnsmasq'
         'iptables')
conflicts=('create_ap')
provides=('create_ap' 'wihotspot')
optdepends=('haveged: For random MAC generation')
makedepends=('cmake' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lakinduakash/linux-wifi-hotspot/archive/wihotspot-${pkgver}.tar.gz"
        'https://github.com/lakinduakash/linux-wifi-hotspot/raw/master/src/desktop/hotspot.png')
sha256sums=('964166d2411395ae0b8d5042ea367ceecc5a43c31251682c465044cc4a01fdd8'
            '00b1f5a4c225ea83d8cd1036d57de17a41c4428b667818180eea45610147b5b9')

build() {
  cd "${pkgname}-wihotspot-${pkgver}"
  make
}

package() {
  cd "${pkgname}-wihotspot-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ${srcdir}/hotspot.png "${pkgdir}/usr/share/pixmaps/wihotspot.png"
  gendesk -f -n --pkgname "${pkgname}" \
            --pkgdesc "$pkgdesc" \
            --name "WifiHotspot" \
            --comment "$pkgdesc" \
            --exec 'gksudo -g wihotspot' \
            --categories 'System;' \
            --icon wihotspot
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications/"
}
# vim:set ts=2 sw=2 et:
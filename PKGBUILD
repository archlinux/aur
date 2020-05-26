# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=linux-wifi-hotspot
pkgver=2.0.0
pkgrel=1
pkgdesc='Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)'
arch=('x86_64')
url='https://github.com/lakinduakash/linux-wifi-hotspot'
license=('BSD')
depends=('hostapd'
         'iw'
         'gtk3'
         'gksu'
         'procps-ng'
         'dnsmasq')
conflicts=('create_ap')
provides=('create_ap' 'wihotspot')
optdepends=('haveged: For random MAC generation')
makedepends=('cmake' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lakinduakash/linux-wifi-hotspot/archive/v${pkgver}.tar.gz"
        'https://github.com/lakinduakash/linux-wifi-hotspot/raw/master/src/desktop/hotspot.png')
sha256sums=('c364b3ac184f7939a8ed2d545e958791cfabc94ea9d5dcc077ca8625ef9b96c0'
            '00b1f5a4c225ea83d8cd1036d57de17a41c4428b667818180eea45610147b5b9')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s|running_info|h_running_info|g" src/ui/h_prop.c
  sed -i "s|running_info|h_running_info|g" src/ui/h_prop.h
  sed -i "566s|get_running_info|get_h_running_info|" src/ui/ui.c
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
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
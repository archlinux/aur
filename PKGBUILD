# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=linux-wifi-hotspot
pkgver=2.0.0
pkgrel=4
pkgdesc='Create virtual wifi hotspot using same wifi card which is connected to an AP + many features (a GUI tool)'
arch=('x86_64')
url='https://github.com/lakinduakash/linux-wifi-hotspot'
license=('BSD')
depends=('hostapd'
         'iw'
         'gtk3'
         'procps-ng'
         'dnsmasq'
         'iproute2')
conflicts=('create_ap' 'wihotspot')
provides=('create_ap' 'wihotspot')
install="$pkgname.install"
optdepends=('haveged: For random MAC generation'
            'iwconfig: if iw cannot recognize your adapter')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('c364b3ac184f7939a8ed2d545e958791cfabc94ea9d5dcc077ca8625ef9b96c0')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Cannot use visudo in fakeroot environment, move to install file
  sed -i '15d' src/scripts/Makefile

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

  install -Dm644 LICENSE -t \
   "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 src/desktop/hotspot.png \
    "$pkgdir/usr/share/pixmaps/wihotspot.png"
  install -Dm644 src/desktop/wifihotspot.desktop \
    "$pkgdir/usr/share/applications/wihotspot.desktop"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$pkgname"
}
# vim:set ts=2 sw=2 et:

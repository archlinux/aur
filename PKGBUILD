# Maintainer: Kiri <kiri_so@gmail.com>
pkgname=v2ray-bin
pkgver=4.16.3
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions"
arch=('x86_64')
url="https://github.com/v2ray/v2ray-core"
license=('MIT')
provides=('v2ray' 'v2ctl')
conflicts=('v2ray' 'v2ray-git')
install=
source=("${pkgname}-v${pkgver}.zip::https://github.com/v2ray/v2ray-core/releases/download/v${pkgver}/v2ray-linux-64.zip"
"LICENSE::https://raw.githubusercontent.com/v2ray/v2ray-core/master/LICENSE"
"v2ray@.service")
md5sums=('336142d56943d5581cbed2c081216126'
         '73b7b166bcb50fb34597b04079c926d9'
         '72815aad469563187d9ba088020b7726')

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/v2ray-bin/LICENSE
  install -Dm644 systemd/v2ray.service "$pkgdir"/usr/lib/systemd/system/v2ray.service
  sed -i -e '/ExecStart/i Environment=V2RAY_LOCATION_ASSET=/etc/v2ray' \
         -e 's|/usr/bin/v2ray/v2ray|/usr/bin/v2ray|' \
         "$pkgdir"/usr/lib/systemd/system/v2ray.service
  install -Dm644 geoip.dat geosite.dat -t "$pkgdir"/etc/v2ray/
  install -Dm755 "$srcdir"/v2ray -t "$pkgdir"/usr/bin/
  install -Dm755 "$srcdir"/v2ctl -t "$pkgdir"/usr/bin/
  install -Dm644 "$srcdir"/v2ray@.service "$pkgdir"/usr/lib/systemd/system/v2ray@.service
}
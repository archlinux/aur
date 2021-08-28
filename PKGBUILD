# Maintainer: llxray <c60@outlook.de>
pkgname=vxray-rules-dat-git
_pkgname=vxray-rules-dat
pkgdesc="Enhanced edition of V2Ray and Xray rules dat files, compatible with Trojan-Go. Automaitcally update. DO NOT flag out-dated."
pkgver=r202108272209
pkgrel=1
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL')

provides=('xray-domain-list-community' 'xray-geoip' 'v2ray-domain-list-community' 'v2ray-geoip' 'v2ray-rules-dat-git')
conflicts=('xray-domain-list-community' 'xray-geoip' 'v2ray-domain-list-community' 'v2ray-geoip' 'v2ray-rules-dat-git')

makedepends=('git')
depends=('curl')

install="vxray-rules-dat-git.install"

source=(
  "$pkgname::git+$url.git"
  vxray-rules-dat-git.install
  vxray-rules-dat-updater
  vxray-rules-dat-updater.sysusers
  vxray-rules-dat-updater.tmpfiles
  vxray-rules-dat-updater.service
  vxray-rules-dat-updater.timer
)
sha256sums=(
  'SKIP'
  'eb1d2175b8be7f9779639b2b24d8260f83116c9a743f1fb0052f056518ccfd11'
  'ef9498a1e5bd99cece2d43cb24e4ce7afcf274171e33159e90f210a31c064004'
  'c855bae9e8a9e3fb7b5be4271bf6e05ad441eacd8272d505ee55a407b6bd263e'
  '1c3c0b854bbfd96b0d84383bfff84eb70e69ac5193b7a535f75183ca28634fc2'
  'e282e023e2f4fbffabedc19a01c33e03cc5049c7cb2cd6e36398233a16bd2b84'
  '5bd55042d53d3794f27483277056f06f5e55d0e7702b0093ec6f17d7da6d548c'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  pushd "${srcdir}/${pkgname}"
  git switch release >/dev/null 2>&1
  sha256sum --check "./geoip.dat.sha256sum"
  sha256sum --check "./geosite.dat.sha256sum"
  install -Dm644 "./geoip.dat" "${pkgdir}/usr/share/xray/geoip.dat"
  install -Dm644 "./geoip.dat" "${pkgdir}/usr/share/v2ray/geoip.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/usr/share/xray/geosite.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/usr/share/v2ray/geosite.dat"

  popd
  install -Dm755 "./${_pkgname}-updater" "${pkgdir}/usr/bin/${_pkgname}-updater"
  install -Dm644 "./${_pkgname}-updater.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-updater.conf"
  install -Dm644 "./${_pkgname}-updater.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-updater.conf"
  install -Dm644 "./${_pkgname}-updater.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater.service"
  install -Dm644 "./${_pkgname}-updater.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater.timer"
}

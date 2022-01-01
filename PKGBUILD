# Maintainer: llxray <c60@outlook.de>
pkgname=vxray-rules-dat-git
_pkgname=vxray-rules-dat
pkgdesc="Enhanced edition of V2Ray and Xray rules dat files, compatible with Trojan-Go. Automaitcally update by using crontab. DO NOT flag out-dated."
pkgver=r202201010556
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
  vxray-rules-dat-updater.tmpfiles
  vxray-rules-dat-updater.service
)
sha256sums=(
  'SKIP'
  'c30723eb0702e2e72dacb9b987f6c94afdf3235bc0f7d4fd6cc89c098f9e000d'
  'b57de5f1ea5c80b8b8d11d99691206f0a7db1c8543ba17432919aa9dd7acff55'
  '1c3c0b854bbfd96b0d84383bfff84eb70e69ac5193b7a535f75183ca28634fc2'
  '62377bc329477f85639eacf634fe32c1ff735cd5a636f949addc1ec036f59607'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git switch release >/dev/null 2>&1
  printf "r%s" "$(git log --pretty=\"format:%B\" HEAD | tr -dc '[:digit:]')"
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
  install -Dm644 "./${_pkgname}-updater.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-updater.conf"
  install -Dm644 "./${_pkgname}-updater.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater.service"
}

# Maintainer: llxray <c60@outlook.de>
# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=v2ray-rules-dat-git-for-xray
_pkgname=v2ray-rules-dat
pkgdesc="Enhanced edition of Xray rules dat files, compatible with Trojan-Go. Automaitcally update."
pkgver=r202108212209
pkgrel=2
arch=( 'any' )
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=( 'GPL3' )

provides=( 'xray-domain-list-community' 'xray-geoip' )
conflicts=( 'xray-domain-list-community' 'xray-geoip' )

makedepends=( 'git' )
depends=( 'xray' )

install="v2ray-rules-dat-git-for-xray.install"

source=(
  "$pkgname::git+$url.git"
  v2ray-rules-dat-updater-for-xray
  v2ray-rules-dat-updater-for-xray.sysusers
  v2ray-rules-dat-updater-for-xray.tmpfiles
  v2ray-rules-dat-updater-for-xray.service
  v2ray-rules-dat-updater-for-xray.timer
)
sha256sums=(
  'SKIP'
  'ab64a3386b2e8321b19108f825001ce08e7279901e7ff3429744fc4a9c97f0e2'
  'f5d515d435a6bccfdeeb73821313cddabddd15a9b90735551ff404c4f7c2415a'
  'e89a361fb9512af967dd6bc1590c621a002486264b049d5d6285d7adf3ea977e'
  'b3cb9bf9a605777a38a156c2b64a7f3005490db12ce4c578642af9a8f572d3d4'
  '5bd55042d53d3794f27483277056f06f5e55d0e7702b0093ec6f17d7da6d548c'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git switch release > /dev/null 2>&1
  printf "r%s" "$(git log --pretty=\"format:%B\" HEAD | tr -dc '[:digit:]')"
}

package() {
  pushd "${srcdir}/${pkgname}"
  git switch release > /dev/null 2>&1

  sha256sum --check "./geoip.dat.sha256sum"
  sha256sum --check "./geosite.dat.sha256sum"

  install -Dm644 "./geoip.dat"   "${pkgdir}/usr/share/xray/geoip.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/usr/share/xray/geosite.dat"

  popd
  install -Dm755 "./${_pkgname}-updater-for-xray"          "${pkgdir}/usr/bin/${_pkgname}-updater-for-xray"
  install -Dm644 "./${_pkgname}-updater-for-xray.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-updater-for-xray.conf"
  install -Dm644 "./${_pkgname}-updater-for-xray.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-updater-for-xray.conf"
  install -Dm644 "./${_pkgname}-updater-for-xray.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater-for-xray.service"
  install -Dm644 "./${_pkgname}-updater-for-xray.timer"    "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater-for-xray.timer"
}

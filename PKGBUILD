# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>
pkgname=v2ray-rules-dat-git
_pkgname=v2ray-rules-dat
pkgdesc="Enhanced edition of V2Ray rules dat files, compatible with Trojan-Go."
pkgver=r202107082209
pkgrel=1
arch=( 'any' )
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=( 'GPL3' )

provides=( 'v2ray-domain-list-community' 'v2ray-geoip' )
conflicts=( 'v2ray-domain-list-community' 'v2ray-geoip' )

makedepends=( 'git' )

install="v2ray-rules-dat-git.install"

source=(
  "$pkgname::git+$url.git"
  v2ray-rules-dat-updater.sysusers
  v2ray-rules-dat-updater.tmpfiles
  v2ray-rules-dat-updater.service
  v2ray-rules-dat-updater.timer
)
sha256sums=(
  'SKIP'
  '694e646c418c0a37480762826c9b52fc83b2bfbc02f10b4d71d8152ef7227a6a'
  '2383bc838fdce1d6ec0af138e587c9e5d79a9fdf70f28ec565835bef5cd087cd'
  'b813fa35957b0facba124d51541b562a3e6f18bcad9f6ca7dcf1c64af236a8a0'
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

  install -Dm644 "./geoip.dat"   "${pkgdir}/usr/share/v2ray/geoip.dat"
  install -Dm644 "./geosite.dat" "${pkgdir}/usr/share/v2ray/geosite.dat"

  popd
  install -Dm644 "./${_pkgname}-updater.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-updater.conf"
  install -Dm644 "./${_pkgname}-updater.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-updater.conf"
  install -Dm644 "./${_pkgname}-updater.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater.service"
  install -Dm644 "./${_pkgname}-updater.timer"    "${pkgdir}/usr/lib/systemd/system/${_pkgname}-updater.timer"
}

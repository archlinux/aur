# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=sing-geoip
pkgbase=${_pkgbase}-git
pkgname=("${_pkgbase}-common-git" "${_pkgbase}-rule-set-git" "${_pkgbase}-db-git")
pkgver=20231212.r1.g9c34309
pkgrel=2

pkgdesc='sing-geoip'
arch=('any')
url="https://github.com/SagerNet/sing-geoip"
license=('GPL3')

makedepends=(go git)

source=("git+https://github.com/SagerNet/sing-geoip.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_pkgbase} && git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgbase} && NO_SKIP=true go run -v .
}

package_sing-geoip-common-git() {
  pkgdesc='sing-geoip (common files)'
  provides=(sing-geoip-common)
  conflicts=(sing-geoip-common)

  install -Dm644 "${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_sing-geoip-rule-set-git() {
  pkgdesc='sing-geoip (rule sets)'
  depends=(sing-geoip-common-git)
  provides=(sing-geoip sing-geoip-rule-set)
  conflicts=(sing-geoip-rule-set)

  install -dm755 "${pkgdir}/usr/share/${_pkgbase}/rule-set"
  install -Dm644 "${_pkgbase}/rule-set/"* "${pkgdir}/usr/share/${_pkgbase}/rule-set"
}

package_sing-geoip-db-git() {
  pkgdesc='sing-geoip (database)'
  depends=(sing-geoip-common-git)
  provides=(sing-geoip sing-geoip-db)
  conflicts=(sing-geoip-db)
  replaces=(sing-geoip-git)

  install -dm755 "${pkgdir}/usr/share/${_pkgbase}"
  install -Dm644 "${_pkgbase}/"*.db "${pkgdir}/usr/share/${_pkgbase}"
}

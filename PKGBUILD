# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=sing-geoip-git
_pkgname=sing-geoip
pkgver=20230312
pkgrel=1

pkgdesc='sing-geoip database'
arch=('any')
_repo="SagerNet/${_pkgname}"
url="https://github.com/${_repo}"
license=('GPL3')

makedepends=('go')
conflicts=("$_pkgname")
provides=("$_pkgname")

_branch=main
source=("src.${pkgver}.tar.gz::https://codeload.github.com/${_repo}/tar.gz/refs/heads/${_branch}")
sha256sums=(SKIP)

pkgver() {
  curl -s https://api.github.com/repos/Dreamacro/maxmind-geoip/releases/latest \
    | grep "tag_name" | cut -d '"' -f 4
}

_builddir="${_pkgname}-${_branch}"
build () {
  cd "$_builddir"
  NO_SKIP=true ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.20 go run -v .
}

package() {
    install -Dm644 "${_builddir}/geoip-cn.db" -t "${pkgdir}/usr/share/${_pkgname}"
    install -Dm644 "${_builddir}/geoip.db"    -t "${pkgdir}/usr/share/${_pkgname}"
    install -Dm644 "${_builddir}/LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

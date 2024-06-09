# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=grafterm
pkgname=${_pkgname}-git
pkgver=0.2.0.r6.b4f1144
pkgrel=1
pkgdesc="Metrics dashboards on terminal (a grafana inspired terminal version)"
arch=('any')
url="https://github.com/slok/${_pkgname}"
license=('Apache')
makedepends=('git' 'go')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  go build "./cmd/${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "Readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  find "docs" -mindepth 1 -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/" \;
  find "dashboard-examples" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;
}

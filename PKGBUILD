# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="grafterm"
pkgname="${_pkgname}-git"
pkgver=0.2.0.r6.gb4f1144
pkgrel=1
pkgdesc="Metrics dashboards on terminal (a grafana inspired terminal version)"
arch=('any')
url="https://github.com/slok/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
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

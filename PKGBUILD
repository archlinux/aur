# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-tracestrack
pkgname="${_pkgname}-git"
epoch=0
pkgver=r2.20250522.780a1a7
pkgrel=1
pkgdesc="Maps served by Tracestrack Maps for KDE marble. API key required and asked for during build."
url="https://gitlab.com/dreieckli/marble-maps-tracestrack"
arch=('any')
license=(
  'LicenseRef-Public_Domain'
  'ODbL-1.0'
  'CC-BY-4.0'
)
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'bash'
  'git'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "marble-maps-tracestrack-base"
  "marble-maps-tracestrack-topo"
)
conflicts=(
  "${_pkgname}"
  "marble-maps-tracestrack-base"
  "marble-maps-tracestrack-topo"
)
replaces=()
options=('emptydirs')
source=(
  "${_pkgname}::git+https://gitlab.com/dreieckli/marble-maps-tracestrack.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./build.sh
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -pv "${pkgdir}/usr/share/marble/data/maps/earth/"
  cp -rv build/tracestrack-* "${pkgdir}/usr/share/marble/data/maps/earth/"

  install -v -D -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -v -D -m644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.TXT"
}

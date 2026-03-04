# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-sachsen
pkgname="${_pkgname}-git"
epoch=0
pkgver=r10.20260304.5339929
pkgrel=1
pkgdesc="Aerial (RGB and CIR) and topographic (DTK10, DTK25, DTK50, DTK100 and historic) maps provided by the German federal state of Saxony. WMS maps, if 'marble' crashes try 'marble-qt'."
#url="https://www.landesvermessung.sachsen.de/geodaten-online-3962.html"
url="https://codeberg.org/dreieck/marble-maps-sachsen"
arch=('any')
license=(
  'Unlicense'
  'LicenseRef-GeoSN'
)
groups=(
  'marble-maps'
)
depends=(
  'marble-common'
)
makedepends=(
  'bash'
  'git'
)
optdepends=()
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}<=20230922.01"
)
options=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

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

  mkdir -pv "${pkgdir}/usr/share/marble/data/maps/earth"
  cp -rf build/* "${pkgdir}/usr/share/marble/data/maps/earth"/
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING.txt
  ln -sv "/usr/share/licenses/${pkgname}/COPYING.txt" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.txt"
}

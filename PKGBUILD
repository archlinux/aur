# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-extra
pkgname="${_pkgname}-git"
epoch=0
pkgver=r34.20250522.9690e45
pkgrel=2
pkgdesc="Additional maps for marble. Includes: "
url="https://gitlab.com/dreieckli/marble-maps-extra"
arch=('any')
license=(
  'CC-BY-NC-SA-3.0' # The .dgml files and the `logo.jpg`
  'CC-BY-SA-3.0'    # The OpenTopoMap renderings
  'CC-BY-SA-2.0'    # The OpenStreetMap renderings
  'ODbL-1.0'        # The OpenStreetMap data
  'LicenseRef-SRTM' # The SRTM data included in some maps (most likely public domain, see https://gis.stackexchange.com/a/444078/90521)
)
groups=()
depends=(
  'marble-common'
)
makedepends=(
  'bash'
  'git'
)
optdepends=(
  'marble-maps-thunderforest:   Additional maps served by thunderforest.com.'
  'marble-maps-tracestrack:     Additional maps served by tracestrack.com.'
  'marble-maps-sachsen:         Additional maps for the German federal state "Sachsen".'
  'marble-maps-googlemaps:      Google Maps.'
  'marble-maps-googlesat:       Google satellite.'
  'marble-maps-virtualearthos:  Bing maps.'
  'marble-maps-virtualearth:    Bing satellite.'
  'marble-restricted-maps:      For additional maps with restricted licensing.'
)
provides=(
  "${_pkgname}=${pkgver}"
  'marble-maps-hillshading-karry'
  'marble-maps-hillshading'
  'marble-maps-openstreetmap-hillshading'
  'marble-maps-openstreetmap'
  'marble-maps-openstreetmap-fr'
  'marble-maps-opentopomap'
  'marble-maps-oepnvkarte'
)
conflicts=("${_pkgname}")
replaces=()
options=('emptydirs')
source=(
  "${_pkgname}::git+${url}.git"
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

package() {
  cd "${srcdir}/${_pkgname}"

  install -dvm755 "${pkgdir}/usr/share/marble/data/maps"
  cp -rv maps/* "${pkgdir}/usr/share/marble/data/maps"/

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "README.md"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING.md"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "license_texts"/*

  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.md" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING.md"
}

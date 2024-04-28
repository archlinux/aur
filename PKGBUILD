# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=scribus-colornerd
_gitpkgname=colornerd
pkgver=2.4.12
pkgrel=2
pkgdesc='Comprehensive library of proprietary color swatches for Scribus'
arch=('any')
url='https://github.com/jpederson/colornerd'
license=('LicenseRef-unknown')
depends=('scribus')
makedepends=('jq' 'python' 'python-xmltodict')
conflicts=('scribus-colornerd-git')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jpederson/colornerd/archive/refs/tags/${pkgver}.tar.gz"
  'convert_to_scribus.py'
)

sha512sums=(
  'f1651607f3ac5873f57cb55216f02b220fc4a35afefd904287c273acdd28ce8c5c962a87ef64f8cb988e660657ef69d450846f017d94549f056b2677fb165586'
  'ad5aca37931e7465092d426fd9acaf6d28b8b0b57550113d8461afe1ccc91ff3f2cebf0165c8f0be4e5bd9dcb1352d3900d9633ec632f227d1cac111c5cd1a66'
)

build() {
  local swatch_json
  local target_basename

  mkdir -p "${srcdir}/${_gitpkgname}-${pkgver}/scribus-swatches"

  for swatch_json in "${srcdir}/${_gitpkgname}-${pkgver}/json"/*.json; do
    target_basename="$(
      jq -r --arg filename "$(basename -s .json "${swatch_json}")" \
        '.[] | select(.filename == $filename) | .title' \
        "${srcdir}/${_gitpkgname}-${pkgver}/_dev/books.json"
    ).xml"
    echo >&2 "Building ${target_basename} for Scribus"
    python convert_to_scribus.py < "${swatch_json}" \
      > "${srcdir}/${_gitpkgname}-${pkgver}/scribus-swatches/${target_basename}"
  done
}

package() {
  echo >&2 'Packaging swatches for Scribus'
  mkdir -p "${pkgdir}/usr/share/scribus"
  cp -r --preserve=mode -T \
    "${srcdir}/${_gitpkgname}-${pkgver}/scribus-swatches" \
    "${pkgdir}/usr/share/scribus/swatches"
}

# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=scribus-colornerd
_gitpkgname=colornerd
pkgver=2.4.12
pkgrel=1
pkgdesc='Comprehensive library of proprietary color swatches for Scribus'
arch=('any')
url='https://github.com/jpederson/colornerd'
license=('unknown')
depends=('scribus')
makedepends=('jq' 'python' 'python-xmltodict')
conflicts=('scribus-colornerd-git')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jpederson/colornerd/archive/refs/tags/${pkgver}.tar.gz"
  'convert_to_scribus.py'
)

sha512sums=(
  'f1651607f3ac5873f57cb55216f02b220fc4a35afefd904287c273acdd28ce8c5c962a87ef64f8cb988e660657ef69d450846f017d94549f056b2677fb165586'
  '2db7ad78d48f738e16c29d78db875201a471eedf472f2f32e8e659af42b2db379712e0acd5934c10ae5a9952969c444919885be59c461b7fa43864bccde2d916'
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

# Maintainer: dreieck

_pkgname=flightgear-photoscenery-creatorscripts
pkgname="${_pkgname}-git"
pkgver=r70.20210117.14f98bf
pkgrel=2
pkgdesc="Phtoscenery support (i.e. using satellite images instead of texture) for FlightGear. See documentation for usage."
arch=('any')
url="https://github.com/nathanielwarner/flightgear-photoscenery/"
license=('GPL2')
depends=(
  'python>=3'
  'python-pillow'
  'python-requests'
)
makedepends=(
  'git'
)
optdepends=(
  "flightgear: To actually see the downloaded photoscenery within the flight simulator."
  "imagemagick: Needed for 'fgfs-photoscenery-create_dds' if 'nvcompress' is not available."
  "nvidia-texture-tools: To use 'nvcompress' instead of ImageMagick in 'fgfs-photoscenery-create_dds'."
  "perl: To be able to use 'fgfs-photoscenery-create_bbox' (download by automatic bounding box calculation)."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+git://github.com/nathanielwarner/flightgear-photoscenery.git"
  "fgfs-photoscenery-creator.sh"
  "fgfs-photoscenery-create_bbox.sh"
  "fgfs-photoscenery-create_dds.sh"
)
sha256sums=(
  'SKIP'
  '916a882ed5b8840dc9f9df48ae802c194944b5e0ee94e4a8aa69b32ca9f10d66'
  '89e2077edac7d3d3e94e6628554b3157ad795eb3a0798ee4ddb916e404ea2e22'
  '4dd90f205b7776c306c77d61bc9fede307d9630b4583ab688410835face1a5c5'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m755 creator.py "${pkgdir}/usr/lib/${_pkgname}/creator.py"
  install -D -v -m755 create_bbox.pl "${pkgdir}/usr/lib/${_pkgname}/create_bbox.pl"
  install -D -v -m755 create_dds.sh "${pkgdir}/usr/lib/${_pkgname}/create_dds.sh"

  install -D -v -m755 "${srcdir}/fgfs-photoscenery-creator.sh" "${pkgdir}/usr/bin/fgfs-photoscenery-creator"
  install -D -v -m755 "${srcdir}/fgfs-photoscenery-create_bbox.sh" "${pkgdir}/usr/bin/fgfs-photoscenery-create_bbox"
  install -D -v -m755 "${srcdir}/fgfs-photoscenery-create_dds.sh" "${pkgdir}/usr/bin/fgfs-photoscenery-create_dds"

  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv screenshots "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}

# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Leray <alexandre@stdin.fr>

pkgname=inkscape-axidraw-bin
pkgver=3.9.5
_zipname="AxiDraw_${pkgver//./}_LinX86"
pkgrel=2
pkgdesc='Inkscape extension for Axidraw'
provides=('inkscape-axidraw' 'inkscape-eggbot')
conflicts=('inkscape-axidraw' 'inkscape-eggbot')
url='https://wiki.evilmadscientist.com/Axidraw_Software_Installation#Linux'
depends=('python' 'inkscape')
license=('GPL2')
arch=('x86_64')
source=(
  "https://cdn.evilmadscientist.com/dl/ad/public/${pkgver//./}/${_zipname}.zip"
  'github-pr-18.patch'
)
sha256sums=(
  'd3d53e90dd92bf5e0e1a2042500996e1806bd933edcb839087dddcd6d31d783d'
  'e6c68a3ad22362927dd0bec9da4b30a010606cf8ad110a7a77e29b8ec34eb9e7'
)

prepare() {
  cd "${srcdir}/${_zipname}"

  # Fix syntax warning dialog under Python 3.12
  # See also:
  # https://github.com/evil-mad/ink_extensions/pull/18
  patch -p1 -d 'axidraw_deps' < ../github-pr-18.patch
}

package() {
  echo >&2 'Packaging the Inkscape extension'
  mkdir -p "${pkgdir}/usr/share/inkscape/extensions"
  cp -R --preserve=mode -T "${srcdir}/${_zipname}" \
    "${pkgdir}/usr/share/inkscape/extensions/axidraw"

  echo >&2 'Packaging the license of included SVG fonts'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_zipname}/svg_fonts/OFL.txt"
}

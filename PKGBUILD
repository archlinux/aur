# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-pony-island
_shortname=pony_island
pkgver=1.20.6
pkgrel=1
pkgdesc='Suspense puzzle game in disguise. GOG version.'
arch=('x86_64')
url='https://www.pony-island.com/'
license=('custom')
depends=(
  'gdk-pixbuf2'
  'glib2'
  'gtk2'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxrandr'
)
makedepends=('lgogdownloader')
options=('!strip')
_shortname="${pkgname#gog-}"
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname/-/_}/en3installer4"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '21b5a5bd2a6118178eeb4fd8a5db30e0d05918794ff5065bb25637f97aed360bbf3090533b48c582771da713bd0b0d292812a71a8f1b0b6a71352edda343a558'
  '7fd40f53c8f53a31ab195d25f74c838543c8c01f2d424f2d6622b856a79dc0659d029c912b0022ba67c86f2c0a59caeaa1e488e2d45c839c8148952131b36f1d'
  'a54b3d1abfdf74bac7d2ba7d32550552cf289009fec5072370ddbf3cc49f8fe90a39e6288f280a5a4af270924ca1c598c3770b57b296a8e9d25253618fbe3332'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

package() {
  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"

  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/${_shortname}/data/noarch/game"
  cp -R --preserve=mode \
    "${srcdir}/data/noarch/game/64" \
    "${pkgdir}/opt/${_shortname}/data/noarch/game/"
  cp -R --preserve=mode \
    "${srcdir}/data/noarch"/{start.sh,support} \
    "${pkgdir}/opt/${_shortname}/data/noarch/"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

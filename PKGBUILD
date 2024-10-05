# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-night-in-the-woods
pkgver=406.21109
pkgrel=1
pkgdesc='Adventure game focused on exploration, story, and character, starring college dropout Mae Borowski. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
  'zlib'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver%.*}_(${pkgver##*.}).sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '9a8baf72b4e161668d6d962a84f5cb49fcdd842a96734a2afbfbf9fb7ffe3c635b07a829d5ba66ff39cb1952fd542610e32da1e32b8ba2e29defe289d090d93c'
  '4a82741730a730b384a05e3985fd73b437e29af7489cfa1d0c120664b6335ad0cc693b13d72f9f509074e92d2b59ad50f48f919c4a30343360f0d4d116ffdb79'
  '1b3511558793cc30cb935c4b90dee03f2728bbc3946653acfe89e325281b0e41e8ee8814a173a8ffce8ca865dcc6ac14909da5770a25ac2d81d1f834d190a538'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/support/yad/32"
  rm -fv "${srcdir}/data/noarch/game/Night in the Woods.x86"
  rm -rfv "${srcdir}/data/noarch/game/Night in the Woods_Data/Mono/x86"
  rm -rfv "${srcdir}/data/noarch/game/Night in the Woods_Data/Plugins/x86"
}

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
  mkdir -p "${pkgdir}/opt/${_shortname}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/* \
    "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

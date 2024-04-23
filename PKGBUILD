# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-pepper-grinder
pkgver=392.72763
pkgrel=1
pkgdesc='Action-packed pirate adventure starring Pepper and her drilling device. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'libglvnd'
  'pango'
  'util-linux-libs'
)
makedepends=('lgogdownloader')
options=('!strip')
_setup_basename="${_shortname}_v${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'e593193e482938065f781039fe35ba6d7d82328a8afb6a8ff111c5e2889bf84fc4bde63954d3276ee7c8d98bceac76ffd20a433f5ffa2d76e1e9cc813367ff5e'
  'cb2397f0f41bac863904747193b9472fc58b4ecec1edc8e6aa6f4fbd8a72a2150bcdf5f8c21941ea49f19de0414856f4c5677043ea4d07e17414933488f54db2'
  '53da9b7305c1de689254913dfc7e74bd13b8d0eb4e72c8f57658e5838c77fec521ee648eb9f0de78f96c0f8ca9f5548920c96629664087f55c9453dfb7e86724'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/game/bin32"
  rm -rfv "${srcdir}/data/noarch/support/yad/32"
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

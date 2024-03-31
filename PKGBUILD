# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-scott-whiskers-in-the-search-for-mr-fumbleclaw
pkgver=1.0.155.72227
pkgrel=1
pkgdesc='Point-and-click adventure about cats, Star Trek, and life itself. GOG version.'
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
  'gtk3'
  'pango'
)
makedepends=('lgogdownloader')
options=('!strip')
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

# Need to hard-code the ID because lgogdownloader would force a prompt
# whenever we attempt to download `scott_whiskers_in_the_search_for_mr_fumbleclaw`
# while our GOG account also owns `scott_whiskers_in_the_search_for_mr_fumbleclaw_demo`
_gog_id='1259892701'

source=(
  "${_setup_basename}.sh::gogdownloader://${_gog_id}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'd14550a392ca5c79e1556e6bd1cf0c5340f44a7400dd551289b211effbeea5d5e242dbb7ea1d73abd9933ffc6ea9a0bba1636234bd8995291694a0a4b7c2144b'
  '7787d3e167d34485fbda0cca87c97c879f427a8f4b7e55a5d376eb1e70efab2b15b4a93877486ecb0f50ce044c0f0ae521a810d225e4f007ac0c80c0838881d7'
  '5875d36b43bb583e47fceffa821955d2410d92bbe62fa7c74260c5a7df4e6e014101bbc6589a0b609000b5ba9d465e3251a0dc1c259cce16c743800321296d8e'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
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

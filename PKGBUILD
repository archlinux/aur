# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-tis-100
pkgver=2020.11.14.43142
pkgrel=1
pkgdesc='Open-ended programming game by Zachtronics. Rewrite corrupted code segments to repair the TIS-100 and unlock its secrets. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url='https://www.gog.com/en/game/tis100'
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxrandr'
  'pango'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver%.*}_(${pkgver##*.}).sh::gogdownloader://tis100/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '60b36070a0de507d7db95ead4142d59ef81dd511f34f18502ffcf60cfe0deb4daa493ad6ea85af709199004c1507cc8cac2fb24bcf3021d263127da376b5ab51'
  '9b1d3d6fba82ad464dc627772e569fee51d6576b779dce81b65f6d5a0bea3230d986c73ff8114954023f913b9ee1c0f2284583af46ccadf2793bcc4b25836dff'
  '592a031912c2ea178df51e924d6d5dc98851293589e6ebddb9a8805bdfab81be646d88eb57ee67f0cafe031e8d3bc18bc7a54d0a766edd429ac9063006d22c52'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/support/yad/32"
  rm -fv "${srcdir}/data/noarch/game/tis100.x86"
  rm -rfv "${srcdir}/data/noarch/game/tis100_Data/Mono/x86"
  rm -rfv "${srcdir}/data/noarch/game/tis100_Data/Plugins/x86"
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

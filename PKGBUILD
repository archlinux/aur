# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-firewatch
pkgver=1.12.55089
pkgrel=1
pkgdesc='Single-player first-person mystery set in the Wyoming wilderness. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('custom')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
)
options=('!strip')
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '8bf92dd3480eb258656323422525afd1339a5cdf3cd334b2b89e00a94316b6cbc6ca436dfd767fe6a89d8271ccd81bd331c7216dfed92b7c46dc72f57045b6d9'
  '14229611cec177ec6ed4413c222a85d8b6bc37d005dd3e1af5105e348e48f097030239ad76f2218a60841b516c96014455365a711f1190675d40f30f404015eb'
  '084f15216c49ee00d37bd5c76448e99962bd90f25bbf4b83767e52a065f8c7cfece56f8cc88914c9de421fbf8889d3eea60f88b4d8c16b2eae38aea31f60b5b1'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit executable
  # Fixes false alarm in rebuild-detector
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
    "${srcdir}"/{data,meta,scripts} \
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

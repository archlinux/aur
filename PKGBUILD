# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname="gog-inscryption"
pkgver=1.10.57447
pkgrel=1
pkgdesc='Roguelike deck-building game. GOG version.'
arch=('x86_64')
url='https://www.inscryption.com/'
license=('custom')
makedepends=('lgogdownloader')
conflicts=('gog-inscryption-demo')
options=('!strip')
_shortname="${pkgname#gog-}"
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

# Need to hard-code the ID because lgogdownloader would force a
# prompt whenever we attempt to download `inscryption` while our
# GOG account also owns `inscryption_demo`
_gog_id='1224800338'

source=(
  "${_setup_basename}.sh`
    `::gogdownloader://${_gog_id}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '4a8cec6766bbe77a0cb8bb840fa6bd9212989caa2858cf200a572e2b2df45b2189d2dacbcae3ce7fc67fe94622dc16467bb5634d0904388ec36ab618df85b379'
  '5363b939e602895f082752f3c29716f81e51235249b832f945744b12b23b3dd6dd3220201ac73f69c7f3addd18ff322951fa430cb11f72357373e7f7ad3505dd'
  '921be06790239b5fce6489f48fce737259d65dc922e1932b1ebe0db5347ebce4badd635c259c41ebb985ca1067445fad4735fbc9bad0aad18dff6b9e660422be'
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

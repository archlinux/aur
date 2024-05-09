# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-rail-route
pkgver=2.0.19.0.73164
pkgrel=1
pkgdesc='Design and automate your own railway network. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-custom')
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
conflicts=('gog-rail-route-demo')
options=('!debug')

# Need to hard-code the ID because lgogdownloader would force a
# prompt whenever we attempt to download `rail_route` while
# our GOG account also owns `rail_route_demo`
_gog_id='2011886219'

source=(
  "${_shortname}-${pkgver}.sh::gogdownloader://${_gog_id}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '01ae5af1a87cf8df5ab882b7c1be5cf4aa550d79c9d3e16d5294fe10aaa2473a3cac6f349f2606140a1c356cf3c763486b1bec8d99f81b5b44585a6898d2687b'
  '3e24869eed65b44d252c6913f359d75a90c431d207bafa7fe90c0390fda1becd1b2d4a8060694903ab2928a85f0b3b94b42534f04957f8e5b5b590cdc7fa7b26'
  'aadace0dcf1f13359966cae76dde2b125187480501d2ac6d6569327ecece78f91f881bf74c207703a63477de86b7d537aa40b553d73e8d7aa79fef2e13376d8a'
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

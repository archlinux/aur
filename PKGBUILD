# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-rail-route
pkgver=2.0.8.71371
pkgrel=1
pkgdesc='Design and automate your own railway network. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-custom')
depends=(
  'bash'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'pango'
)
makedepends=('lgogdownloader')
conflicts=('gog-rail-route-demo')
options=('!strip')

# Need to hard-code the ID because lgogdownloader would force a
# prompt whenever we attempt to download `rail_route` while
# our GOG account also owns `rail_route_demo`
_gog_id='2011886219'

source=(
  "${_shortname}_latest.sh::gogdownloader://${_gog_id}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'cb80f3426e4c6ad9a7381ac88656847b9c8cfb9199dd2e510a6ec753a0e942a9e13d8151714c3eb02644a5f83488f88d46c6922aea97e6e4843fe8b45bbf3c44'
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

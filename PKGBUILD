# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-the-will-of-arthur-flabbington
pkgver=2.1.2
pkgrel=1
pkgdesc="Comedy point-and-click adventure. Find your uncle’s lost treasure with the help of a reluctant sidekick. GOG version."
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
options=('!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '2143fb4f82e348348eb5a7c103d11f3ad14862f9b8d82b2e5c5a6c3f834de2e3b41fab020fb59022126cb69c672f56bbdf324fa131713bf90182f3cf30b7d5ed'
  '6c8e948fcf35a08fa6c3712039529a8e1d2d1c68c5ab114a4a013389deed443e6c1f75ad4496a9437e3f3997f2fc2a52776da5a2df03bf6804a1768d0e78e382'
  '63ad09ff0156c793b9b0079ba25c6082d5a4f20e9a7ad8080c133f78098db2a5020663259be681a63f357a7b77ea17433dcd6db8a14c10b2c9a3f7ba9774edc9'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk -F v 'NR==2 { print $2 }' data/noarch/gameinfo)

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
    "${srcdir}"/data/noarch/game/* \
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

# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-owlboy'
pkgver=1.3.6564.30139
pkgrel=1
epoch=1
pkgdesc="Owlboy is a 'hi-bit' adventure game, where you can fly and explore a brand new world in the clouds!"
url="http://www.owlboygame.com/"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('dos2unix')
optdepends=('firejail: Sandbox this application from your OS')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "file://${pkgname//-/_}_${pkgver}.sh"
)
sha256sums=(
  '160b4d0fb275d3c1d4d6d574ca4085579e944e67dd32bd0a0c6e79f2e3d105a6'
  '8574e2463800004ddf97e49d2760d834413bf51fda4b1a57ead8cc10b07ac4f2'
  '65ab113d3e465ab0aa4bec514ba36f91219b38743361f508af8c96b7f5ba4b3d'
)

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                     \
    data/noarch/support/*.{sh,shlib} \
    "${pkgdir}/opt/${pkgname}/support/"
  install -m 644                                      \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644                   \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644                   \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Plebians...
  while read -r ini; do
    chmod g+w "${ini}"
    file "${ini}" | grep -Ei 'CRLF' && dos2unix "${ini}"
  done < <(find "${pkgdir}" -name *.ini)
  # Don't even get me started on why the fuck I have to do this...
  chgrp -R games "${pkgdir}"
}

# vim: ts=2 sw=2 et:

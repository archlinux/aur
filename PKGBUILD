# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-three-minutes-to-eight
pkgver=0.6.3.68965
pkgrel=1
pkgdesc='Pixel art adventure game. The protagonist is destined to meet their demise at precisely 07:57 PM. GOG version.'
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
  'c3973de0bcf7b7537369efc370e60f95a0dab6c3952ee14812e9efc6925f12cbcf3f3f6d216fd34a0356c132ad7e798b11a2a079a3ffe5da7959fdc77d205786'
  '91f35ceadb9568afdcee982547cca0d91d1edc2ff8c3a3e5386e2a3abb7214795756554609b60970d684463cd105e9c4199831a3d55c751b72df5610ab96dec4'
  'dccd0e0148268d55f2e1e80f343e36d3e58fe2f893f9fd3c499bbbf703841b16787c63d650114aed0c5255532a54d81620ab613e7ff34f647ebdc51827a5c4c4'
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

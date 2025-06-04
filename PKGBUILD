# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-pony-island
pkgver=1.20.6
pkgrel=2
pkgdesc='Suspense puzzle game in disguise. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url='https://www.pony-island.com/ponyisland1'
license=('LicenseRef-eula')
depends=(
  'bash'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk2'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxrandr'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer4"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '21b5a5bd2a6118178eeb4fd8a5db30e0d05918794ff5065bb25637f97aed360bbf3090533b48c582771da713bd0b0d292812a71a8f1b0b6a71352edda343a558'
  '3d8ba5a2aec4848ba76a79ec6e78ff570c70863ff805213cbc8e23e9326e925b674640da74b55e9612d5afed4a2bc15c9a9d6ba979245d4dcfeef5f0ae5a251c'
  '3ce1e5b65fbd500474e9ce01ed9752e7e4b18c4e322d498397fe9378282db3251a9246ee710034802c314773b3e1c6c92711deba126658781e6c9d347582340a'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -rfv "${srcdir}/data/noarch/game/32"
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

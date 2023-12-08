# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-dandara-trials-of-fear-edition
pkgver=1.3.7.37619
pkgrel=2
pkgdesc='Gravity-defying 2D metroidvania platformer. GOG version.'
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
makedepends=('lgogdownloader')
options=('!strip')

source=(
  "${_shortname}_latest.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'SKIP'
  'ee107b9737c0e08a6eab2c3edd828ad34c2526ac9a16bc6c9ad5e4f2df66a281af102f105825f6194069282fd523a68f9d98b8caac40a50ebc5d11bf7d3344e0'
  'cfb5d7f0462c08e5e6f0424e5d724c44da09900921441f25fcf69462e34e790596adaf1a075a2d4414a65ec7b822c1ad872426ec7a414ff93c8198ad84ae6445'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

pkgver() {
  awk -v ORS=. -e 'NR==2,NR==3' data/noarch/gameinfo | head -c -1
}

prepare() {
  # Remove unneeded 32-bit binaries
  # Fixes false alarms in rebuild-detector
  rm -fv "${srcdir}/data/noarch/game/Dandara.x86"
  rm -rfv "${srcdir}/data/noarch/game/Dandara_Data/Mono/x86"
  rm -rfv "${srcdir}/data/noarch/game/Dandara_Data/Plugins/x86"
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

# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-truberbrook
pkgver=1.6.31066
pkgrel=1
pkgdesc='Mystery sci-fi adventure game with handmade scenery. GOG version.'
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
  'e70350da12597c1d95e865122cdb94c3211a4a1837ba332a2f237f28b607664ad24a0ce32405c7266efed33c9bfa966e86be3c8909f2e6dbce3b0fa5d53cc403'
  '27f3d7a851f9871b2a826740a5d7dbefd5e62bc7add2a3f2d0894f830e4c8cecd73ba26a27a0809d6569ebce94ce26a69938cbce250fdfe8b61c17df2054e197'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

pkgver() {
  awk -v ORS=. -e 'NR==2,NR==3' data/noarch/gameinfo | head -c -1
}

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

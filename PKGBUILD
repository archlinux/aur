# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-the-will-of-arthur-flabbington
pkgver=v1.0.3.68960
pkgrel=1
pkgdesc='Comedy point-and-click adventure. Find your uncle’s lost treasure with the help of a reluctant sidekick. GOG version.'
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
  '6c8e948fcf35a08fa6c3712039529a8e1d2d1c68c5ab114a4a013389deed443e6c1f75ad4496a9437e3f3997f2fc2a52776da5a2df03bf6804a1768d0e78e382'
  '67fb91f25af8ff1aa452ed606fc9e7bcb735d891a2068430c9a594c60531e95897b83d17013676baffd8b3e72f54cc54a246b238fdb5d9bef86391b9f25da5d9'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

pkgver() {
  awk -v ORS=. -e 'NR==2,NR==3' data/noarch/gameinfo | head -c -1
}

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

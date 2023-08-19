# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-book-of-hours
pkgver=2023.8.b.4.66885
pkgrel=1
pkgdesc='Elegant, melancholy, combat-free RPG set in an occult library. GOG version.'
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
options=('!strip')

source=(
  "${_shortname}_latest.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'SKIP'
  '3850a34515d52636af8ee4aaa6cabee65cd981c1702deff98f46e581ed509b6a86daa5bf24bea9d8162eb6cf91bed03b61c1d261ede7d8d70fc6212bbf25e896'
  '1e5b3162716f0ea60e56a5e81ea37f6f85a205d00073926a705302632f7be84bcbc9f9375d917c6827bc949e78b532abbaa79c54d4a01315b82f76cf246de41c'
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

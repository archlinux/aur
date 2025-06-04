# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-inscryption
pkgver=1.10
pkgrel=1
epoch=1
pkgdesc='Roguelike deck-building game. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url='https://www.inscryption.com/'
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
conflicts=('gog-inscryption-demo')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '4a8cec6766bbe77a0cb8bb840fa6bd9212989caa2858cf200a572e2b2df45b2189d2dacbcae3ce7fc67fe94622dc16467bb5634d0904388ec36ab618df85b379'
  '207530262bacd462e7b1c7e119eb11acc61343b71b416f23497f97cb43d9c3b2c5d5e99f23bbdd14d284511da663a55c2a66c3a2e5638d07128a07bcb48591dd'
  'a12da6a1c8d079e9d928c4db3a7b985bd02136f3ef79d9d773f4d326a637d466b55369231ac9647828df758293396e71f09fb0779be00a16377a2dd565af8fd5'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2 { print $1 }' data/noarch/gameinfo)

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

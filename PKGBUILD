# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-truberbrook
pkgver=1.6
pkgrel=1
epoch=1
pkgdesc='Mystery sci-fi adventure game with handmade scenery. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'lib32-gcc-libs'
  'lib32-gdk-pixbuf2'
  'lib32-glib2'
  'lib32-glibc'
  'lib32-gtk2'
  'lib32-zlib'
)
makedepends=('execstack' 'lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'SKIP'
  'e70350da12597c1d95e865122cdb94c3211a4a1837ba332a2f237f28b607664ad24a0ce32405c7266efed33c9bfa966e86be3c8909f2e6dbce3b0fa5d53cc403'
  '8329d85966006c31b191cdc078c08c5df2c26cfeb5af38e17d8ea5c73767e4c151d5793b3d88bffe3376fe4ca962fca7086b54a4656366f500cc4106f1fa2b4a'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Work around glibc 2.41 execstack issue
  # See also: https://sourceware.org/bugzilla/show_bug.cgi?id=32653
  execstack -c "${srcdir}"/data/noarch/game/Truberbrook.x86
  find "${srcdir}"/data/noarch/game \
    -'(' -name 'libfmod*.so' -o -name 'libmono.so' -')' \
    -exec execstack -c '{}' +
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

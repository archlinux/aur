# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-rail-route
pkgver=2.3.22
pkgrel=1
pkgdesc='Design and automate your own railway network. GOG version.'
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
makedepends=('execstack' 'lgogdownloader')
conflicts=('gog-rail-route-demo')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=('c266c33e915df8ea740e6e558107748d3c0b344ee169ea3ac632e76be4c0da15766c795d6581ce89772c81ac0db2bff40c22567496a11fd31dd77e488d25ce63'
            '2ca22352d18d7409cd68a47434d499c0f01fccff998ed890e893cad284eae2cc798d1c3fdb2a669642feb87fda5b5ac2f934b6afd59fec5b277b6e8f999c197b'
            'aadace0dcf1f13359966cae76dde2b125187480501d2ac6d6569327ecece78f91f881bf74c207703a63477de86b7d537aa40b553d73e8d7aa79fef2e13376d8a')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

  # Work around glibc 2.41 execstack issue
  # See also: https://sourceware.org/bugzilla/show_bug.cgi?id=32653
  find "${srcdir}"/data/noarch/game -name 'libfmod*.so' -exec \
    execstack -c '{}' +

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

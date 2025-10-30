# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-rail-route
pkgver=2.3.23
pkgrel=1
pkgdesc='Design and automate your own railway network. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
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

sha512sums=('d4875a18571f824619e9a480bc900cdcc48554524de6d5df205ccf7eba0f4a01ab5dda1ed24602709555240a13a411c8b5afbcee951cbe5af05273afafa36183'
            '2ca22352d18d7409cd68a47434d499c0f01fccff998ed890e893cad284eae2cc798d1c3fdb2a669642feb87fda5b5ac2f934b6afd59fec5b277b6e8f999c197b'
            '33368df35f53e8252a1a132008227a56372fbf84cbe66d46f62e6612f01b1d2ef8990a771ab4d5e866e5ead892e5b4da6f130243ec128025720e08329904f132')

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

  # Remove unneeded executables
  rm -rfv "${srcdir}/data/noarch/support/yad"
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

# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-scott-whiskers-the-search-for-the-golden-cat
pkgver=1.0.52
pkgrel=1
pkgdesc='The next big adventure from our missing cat specialist, Scott Whiskers. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'bash'
  'cairo'
  'dbus'
  'glib2'
  'glibc'
  'gtk3'
  'libdecor'
  'libgcc'
  'libstdc++'
  'pango'
  'wayland'
  'zlib'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver//./_}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=('1fc921ce000a6de97425f2ec7c38ae3f956c16daec669cb9f54e21845242813d9a87398d1bf98a56c5a02075fd2c04026730f3e60a3ba6440f1ad4182b71a9f0'
            'c05d914508f35eeeea1097a079f40783f4a5507504f2aad6ed01d694df45cf05ef3f7e9595abb195eb64909264649ccb795327c7bf1af08c90bbaffdbdb356d6'
            '77d99f738c7c6f0eb8f54826aa8e1ac916d53af26c9a8e702670bcd331682a7cb32815f91c6b2618382c30d614eae8b38c76299ef455b2f6e60e0f9a7ea5c307')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  # Assert that pkgver matches the downloaded version
  diff -u \
    --label 'Expected version' <(echo "${pkgver}") \
    --label 'Actual version' <(awk 'NR==2' data/noarch/gameinfo)

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

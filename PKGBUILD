# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-hollow-knight-silksong
pkgver=1.0.29926
pkgrel=1
pkgdesc='Action-adventure set in a kingdom ruled by silk and song. GOG version.'
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
  'libdecor'
  'libgcc'
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

sha512sums=('c704cbcf6a6cb3c5003126d35418c26b2db4bce1711081d3403f26ffb54c88ac052395cf770e5817c98adce18d77918abe6033334bc3e83401e8dd4a80a25ad4'
            'c6791651a2d8e7ac9d5009f411def4554afce0701f917d3a79f64efd429f7dea07b22bea7caa265255c71ffb30f899ace2bf984aab6ab0c7b5a4fa9d86f625e4'
            '6e7e6ac1c0e141c8d681dc881472aa8b45379c250fd969b3475dcf19e8ddcceccc0cc64fdb80c6d584b00fa1069c89786d8a3784dba7448ed546aecf0c83ab2d')

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

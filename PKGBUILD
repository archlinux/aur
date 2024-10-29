# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-trans-neuronica
pkgver=1.0.7.77218
pkgrel=1
pkgdesc='Puzzle game about making connections both figuratively and literally. GOG version.'
_shortname="${pkgname#gog-}"
arch=('x86_64')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('LicenseRef-eula')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'glibc'
  'gtk2'
  'gtk3'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
makedepends=('lgogdownloader')
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver%.*}_(${pkgver##*.}).sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  'add139a71f6b26a12adf3fc97198598bb8350218aa38885ac4298d9645eda2f39a534cfbe95290bc8d81efb71c25b02b5e5cc9e9af97e51c043f2f15123bee17'
  'de1f811779c6b1388e6cd1974e1d7cc3c247913ad9fa66d7dbf9aa94668c0dd6d1d744762889c1673ec53ed0376f8c33da9ae74d244f416bdcd1fa2b343af563'
  'deca7edce24e4933d10feefa914b5972e371f16c887c7efc1801a36b3e922a7890e81f6e1a1dd1d79da43482f3b4eb831d528aaf8fd2bf598871ad619e00b4bd'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

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

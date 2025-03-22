# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slender-threads
pkgver=1.0.2.80077
pkgrel=1
pkgdesc='Point-and-click thriller adventure. GOG version.'
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
options=('!debug' '!strip')

source=(
  "${_shortname}_${pkgver%.*}_(${pkgver##*.}).sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '2767c03d708cc3360c60dd3d8766a2cf6a1fc096e9b0a5126369f72bbfcb28d4e76c1eca5a359cc0a6a469fd2676d621499a079ada11c99055e96bbda9f77335'
  'b4286df2967fd74297ba0a3e16b10346c3cfe4e6b5e7468774e564fdba4d00397e5ed9dd61955fde6800da5a2db12a920e1878256ce21a130da477ef77be9297'
  '4abcbb18db29cacc1a5cbbf3a611f92d78622be85d23de997876bf15019ac9b8f8f9c84485fcef725ea27cb12611a5b9aae5de42892116df818794a9609d8394'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
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

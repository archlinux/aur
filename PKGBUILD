# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slender-threads-prologue
pkgver=1.0.49233
pkgrel=2
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
makedepends=('execstack')
conflicts=('gog-slender-threads')
options=('!debug' '!strip')
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname%-prologue}.bash"
)

sha512sums=(
  '72d12c20871b1281af78e174f6c5345ee6d583c8015e119a661db18717650959ba7650170a547da1964ba97a3bb32c4bdba250cee85ea0eee2bb86b0501d46c5'
  '7e3bc00eeb9e9290cbb3140e8d92bbe4aa3f250941593f1bedc83cf51b646c55c46804e4619f3e8f902d04bc0c3e693816f54cb2cdda033ed174779d5ce750e0'
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
  mkdir -p "${pkgdir}/opt/${_shortname%-prologue}"
  cp -R --preserve=mode \
    "${srcdir}"/data/noarch/* \
    "${pkgdir}/opt/${_shortname%-prologue}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname%-prologue}.bash" \
    "${pkgdir}/usr/bin/${_shortname%-prologue}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

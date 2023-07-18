# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-slender-threads-prologue
pkgver=1.0.49233
pkgrel=1
pkgdesc='Point-and-click thriller adventure. GOG version.'
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
conflicts=('gog-slender-threads')
options=('!strip')
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_shortname//-/_}/en3installer0"
  "${pkgname}.desktop"
  "${_shortname%-prologue}.bash"
)

sha512sums=(
  '72d12c20871b1281af78e174f6c5345ee6d583c8015e119a661db18717650959ba7650170a547da1964ba97a3bb32c4bdba250cee85ea0eee2bb86b0501d46c5'
  '7e3bc00eeb9e9290cbb3140e8d92bbe4aa3f250941593f1bedc83cf51b646c55c46804e4619f3e8f902d04bc0c3e693816f54cb2cdda033ed174779d5ce750e0'
  'f196a3ee2721f449599fe51cf1ad623a837f6fe640346663cc52ddbee9e51917e22becf01d88d1c295e9d185997d341e6b710ecddae41dc52d6f2c0a6f374654'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

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
  mkdir -p "${pkgdir}/opt/${_shortname%-prologue}"
  cp -R --preserve=mode \
    "${srcdir}"/{data,meta,scripts} \
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

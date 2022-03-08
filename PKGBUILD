# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname="gog-inscryption-demo"
pkgver=2.50729
pkgrel=1
pkgdesc='Roguelike deck-building game. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.inscryption.com/'
license=('custom')
depends=('wine' 'wine-mono')
makedepends=('innoextract' 'lgogdownloader')
optdepends=(
  'lib32-alsa-lib: sound support for ALSA'
  'lib32-libpulse: sound support for PulseAudio'
)
conflicts=('gog-inscryption')
options=('!strip')
install="${pkgname}.install"
_shortname="${pkgname#gog-}"
_setup_basename="setup_${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.exe::gogdownloader://${_shortname/-/_}/en1installer0"
  "${pkgname}.desktop"
  "${_shortname%-demo}.bash"
)

sha512sums=(
  'e7775de1db016b2c0a8092900a04944f5c170545dfcedfe4b1de7855cd3a02ee5e80dbba0d9010fa37400762195f9bb06c3636baf1a0800fd16189ffa12d0a23'
  'fd902d5c85732c034cc2c772efc2c5183dd19b3ce3ac7786890d761079525dbc30421cda5a0f8da3b935adc6e7089f38de82337643369bcf6022216dc3666a9d'
  '0a8db49802625c2207a2efae3b498f53547c79f0b003e6ca020c7aa2e0870e4a6393688d4b1e244f23088cbeab830112bf925c0f464fc58e97c5b5d0582e2232'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
  mkdir -p "${srcdir}/${_shortname}"
  cd "${srcdir}/${_shortname}"
  innoextract -c -m --progress=1 "${srcdir}/${_setup_basename}.exe"
}

package() {
  echo >&2 'Querying GOG ID'
  _gog_id="$(innoextract -s --gog-game-id "${srcdir}/${_setup_basename}.exe")"

  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/${_shortname}/app/goggame-"${_gog_id?}".ico" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/"
  mv "${srcdir}/${_shortname}" "${pkgdir}/opt/${_shortname%-demo}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname%-demo}.bash" \
    "${pkgdir}/usr/bin/${_shortname%-demo}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

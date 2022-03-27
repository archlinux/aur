# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname="gog-inscryption"
pkgver=1.09.54424
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
conflicts=('gog-inscryption-demo')
options=('!strip')
install="${pkgname}.install"
_shortname="${pkgname#gog-}"
_setup_basename="setup_${_shortname}_${pkgver%.*}_(${pkgver##*.})"

# Need to hard-code the ID because lgogdownloader would force a
# prompt whenever we attempt to download `inscryption` while our
# GOG account also owns `inscryption_demo`
_gog_id='1224800338'

source=(
  "${_setup_basename}.exe`
    `::gogdownloader://${_gog_id}/en1installer0"
  "${_setup_basename}-1.bin`
    `::gogdownloader://${_gog_id}/en1installer1"
  "${pkgname}.desktop"
  "${_shortname}.bash"
)

sha512sums=(
  '91743b0bfa8ad7a331f7273b6dfe72b10eb06fff435bbb5fff7006ef8b073295ac938a78af8815003b44148ace1b4646f7032dfdae4898b8d8a309fd2d2b189d'
  '74d04d68fb8bc0e2cf6355b5f71f072438281bb65da1508f728b3da78aa7406b60669d5e1b6cc4e8a6b1230eda38e08f33a0f4b16679aa2fc0cd911974947ecc'
  '65226f2e071bc7dad63d683d6ad5f255dff354ca6c5478fa2e606933383af48d2ee2b2fa1450936227a59e1831f2ff44293d00a835daa98aa215b6e50755a7bf'
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
  echo >&2 'Packaging game icon'
  install -D -m 644 -T \
    "${srcdir}/${_shortname}/app/goggame-"${_gog_id?}".ico" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

  echo >&2 'Packaging game data'
  mkdir -p "${pkgdir}/opt/"
  mv "${srcdir}/${_shortname}" "${pkgdir}/opt/${_shortname}"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T \
    "${srcdir}/${_shortname}.bash" \
    "${pkgdir}/usr/bin/${_shortname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

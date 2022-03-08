# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname="gog-inscryption"
pkgver=1.08.51256
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
  '0e294700cbbe3888ddecc5f1162803434b5c75b7bb4c82c6e23a77753fea35f0a16fe27a0851ed58708522923f4f9563390448703f4fa36d42079e620c5a69cc'
  '75ac79d2d4802dd82627bd921964bcc4957cfa0eaa7e81f2c495ebf4bc27a81372b5779149ab9f024b8634617ec1a2a015fceaf795a1db85f73ae4f579f6a2e2'
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

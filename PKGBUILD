# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=d-trust-card-assistant
pkgver=4.0.0.2
pkgrel=1
pkgdesc='Initialize and configure D-Trust signature cards and seal cards. Requires non-free vendor executable.'
arch=('x86_64')
url='https://www.d-trust.net/en/support/signature-and-seal-cards'
license=('custom')
depends=('wine')
makedepends=('icoutils' 'imagemagick')
options=('!strip')

source=(
  'local://D-Trust_Card_Assistant.exe'
  "${pkgname}.bash"
  "${pkgname}.desktop"
  'https://www.d-trust.net/files/dokumente/pdf/initialisierung_siegelkarten-signaturkarten.pdf'
  'upstream-license.txt'
)

sha512sums=(
  '324753ef298d3026a0ed22a1b3a58dc6bb2ed206bcc5ecade788dfac91ad7b5645e69433922a4bbd02fc83d5e8ba0ddcc9011c8e9cdb2003abed2419e9070d01'
  'ccbe1614b1dd19c0f0c1795eac4e7aca53555750a14834b3f85535111fc6b4ae619085cda89f4aed009fd90fbd2d6aeabdeb23b13e22efa31ab78c0a83c611c3'
  '41ac2b6f50455312d0f97461ec0a6b66c76d40641af6fb7f6fe42cfce6608497de337b0ef4f5603a9658d27f62ee063c2632d1d264400d4acc995145549399c3'
  '786e6c591e053331f18051d626100d5760e33c032790d6ef39499d6d848ccb5631da38cc8055961911d1cc21dd6c0b9da1114a4f91a345b55118d4c167c8f49b'
  '0cfafacbaf2d327ef0094b869e8b76135bb9cf0b2a698609c06f8337fc4fb7d9efdc7052076b9739407e08596bb8edb1630bd9f0b0fe276c651b034521cbefd2'
)

prepare() {
  wrestool -x --output d-trust-card-assistant.ico \
    --type=14 --name=128 --language=1031 D-Trust_Card_Assistant.exe
}

package() {
  echo >&2 'Packaging the desktop file'
  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/initialisierung_siegelkarten-signaturkarten.pdf"

  echo >&2 'Packaging the executable'
  install -D -m 755 -t "${pkgdir}/opt/${pkgname}" \
    "${srcdir}/D-Trust_Card_Assistant.exe"

  echo >&2 'Packaging the icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  # The compressed .ico consists of 4 pixmaps of different sizes.
  # Pixmap #3 has the best quality.
  convert -delete 0,1,2 "${srcdir}/d-trust-card-assistant.ico" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging the launcher'
  install -D -m 755 -T "${srcdir}/${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname}"

  echo >&2 'Packaging the license'
  install -D -m 644 -T "${srcdir}/upstream-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

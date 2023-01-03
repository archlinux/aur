# Maintainer: basxto <archlinux basxto de>


pkgname='emulicious-bin'
_genericname='Emulator'
pkgver=2022.12.30
pkgrel=1
pkgdesc='Game Boy, Game Boy Color, Master System, Game Gear and MSX emulator'
# sms is backwards compatible to sg1000
_mimetype='application/x-gameboy-rom;application/x-gameboy-color-rom;application/x-sms-rom;application/x-sg1000-rom;application/x-gamegear-rom;application/x-msx-rom'
url='https://emulicious.net'
license=('custom' 'BSD')
provides=('emulicious')
arch=('any')
depends=('java-environment' 'sh' 'hicolor-icon-theme')
makedepends=('java-environment-common' 'gendesk' 'dos2unix' 'imagemagick')
source=("$pkgname-$pkgver-$pkgrel.zip::https://emulicious.net/download/emulicious/?wpdmdl=205" 'emulicious.sh')
sha256sums=('9787860516fc8812f9401482d7c6907393d0edc120e1fd60012d02c864fed18e'
            '3f9442376a7a8ba93ff5490826bcd5b5b81c5c62b3a6ec48bcd586a0e42fca66')

prepare() {
  gendesk -f -n
  cd "${srcdir}/"
  # was zipped on windows
  dos2unix ./*.txt
  jar xf Emulicious.jar Emulicious.png
  # resize to a quadratic shape
  magick convert Emulicious.png -background transparent -resize 256x256 -gravity center -extent 256x256 "${pkgname}_256x256.png"
}

# emulicious does not communicate any version numbers
# therefore we take the release date from WhatsNew.txt
pkgver() {
  grep "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" "${srcdir}/WhatsNew.txt" | head -1 | tr - .
}

package() {
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE-JInput.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-JInput"
  cp -r "${srcdir}/Highlighters/" "${srcdir}/MSX/" "${srcdir}/KeyPresets/" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/Emulicious.jar" "${srcdir}/WhatsNew.txt" "${srcdir}/Expressions.txt" "${srcdir}/ReadMe.txt" "${srcdir}/"*.ports  "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 "${srcdir}/emulicious.sh" "${pkgdir}/usr/bin/${provides[0]}"
  install -Dm644 "emulicious.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
  install -Dm644 "${srcdir}/${pkgname}_256x256.png" "${pkgdir}/usr/share//icons/hicolor/256x256/apps/${provides[0]}.png"
  # generate all other icon sizes
  for i in 16 24 32 48 64 72 96 128;do
    install -d "${pkgdir}/usr/share//icons/hicolor/${i}x${i}/apps/"
    magick convert "${srcdir}/${pkgname}_256x256.png" -resize ${i}x${i} "${pkgdir}/usr/share//icons/hicolor/${i}x${i}/apps/${provides[0]}.png"
  done
}

# Maintainer: basxto <archlinux basxto de>


pkgname="emulicious-bin"
_name="emulicious"
_exec="emulicious"
_genericname="Emulator"
pkgver=2021.01.30
pkgrel=3
pkgdesc="Game Boy, Game Boy Color, Master System, Game Gear and MSX emulator"
_mimetype="application/x-gameboy-rom;application/x-gameboy-color-rom;application/x-sms-rom;application/x-gamegear-rom;application/x-msx-rom"
url="https://emulicious.net"
license=('custom', 'BSD')
arch=('any')
depends=('java-environment')
makedepends=('gendesk' 'dos2unix')
source=("$pkgname-$pkgver.zip::https://emulicious.net/download/emulicious/?wpdmdl=205" "emulicious.sh")
sha256sums=('fbe0ac99dae07c19123ecfacca6100a1dc97a9344133a3caa9ab75616892100f'
            '3f9442376a7a8ba93ff5490826bcd5b5b81c5c62b3a6ec48bcd586a0e42fca66')

prepare() {
  gendesk -f -n
  # was zipped on windows
  dos2unix "${srcdir}/"*.txt
}

# emulicious does not communicate any version numbers
# therefore we take the release date from WhatsNew.txt
pkgver() {
  grep "^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" "${srcdir}/WhatsNew.txt" | head -1 | tr - .
}

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/License.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE-JInput.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-JInput"
  cp -r "${srcdir}/Highlighters/" "${srcdir}/MSX/" "${srcdir}/KeyPresets/" "${pkgdir}/usr/share/$pkgname/"
  install -Dm644 "${srcdir}/Emulicious.jar" "${srcdir}/WhatsNew.txt" "${srcdir}/Expressions.txt" "${srcdir}/ReadMe.txt" "${srcdir}/"*.ports  "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 "${srcdir}/emulicious.sh" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}

# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=foobar2000
pkgver=1.3.10
pkgrel=2
pkgdesc="An advanced freeware audio player (uses Wine)."
arch=(i686 x86_64)
url="http://www.foobar2000.org/"
license=('custom')
depends=(wine desktop-file-utils)
makedepends=(unarchiver wget)
source=("foobar2000_v$pkgver.exe::https://www.foobar2000.org/download"
        "LICENSE"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
install="${pkgname}.install"
sha256sums=('48295452e95a8e4e907eba4aafa88b70e6e202cff23b42a53500aefd6c1a48b4'
            '6a0aec62c077dae45b778b9e18ae6f470d5105c020e4e44a67ab267f0bf40e35'
            '3a1876b7f7f9b0297a633d7e6a480f92a2eeea46d8496a3546fcb1b0859be7aa'
            '2031e952d1d1d6cb4c2ff2b879421149f3f0780ca5d3ac03bc9c23fcbbd053d6'
            'cf54a01fdba4fe3de60514fe898680f24439eb43c4655d6892272c15e489eb2d')
DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe %u')

package() {
  # unpack NSIS installer .exe into destination
  unar -q -D -e windows-1252 -o "${pkgdir}/usr/share/${pkgname}" "${srcdir}/${pkgname}_v${pkgver}.exe"

  # remove NSIS installer directory & unneeded files in portable mode
  rm -fr "${pkgdir}/usr/share/${pkgname}/NSIS Plugins Directory" \
            "${pkgdir}/usr/share/${pkgname}/icons" \
            "${pkgdir}/usr/share/${pkgname}/foobar2000 Shell Associations Updater.exe" \
            "${pkgdir}/usr/share/${pkgname}/Register R0"

  # run foobar2000 in portable mode
  touch "${pkgdir}/usr/share/${pkgname}/portable_mode_enabled"

  # Install the license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

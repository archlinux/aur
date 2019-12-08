# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=foobar2000
pkgver=1.5
pkgrel=1
pkgdesc="An advanced freeware audio player (uses Wine)."
arch=(i686 x86_64)
url="http://www.foobar2000.org/"
license=('custom')
depends=(wine desktop-file-utils)
makedepends=(p7zip wget)
source=("foobar2000_v$pkgver.exe::https://www.foobar2000.org/download"
        "LICENSE"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
install="${pkgname}.install"
sha256sums=('5009a25af21e5bb4c34988143e9365fe3883b33671cb5e15dc1ecb2785641fa4'
            '6a0aec62c077dae45b778b9e18ae6f470d5105c020e4e44a67ab267f0bf40e35'
            '3a1876b7f7f9b0297a633d7e6a480f92a2eeea46d8496a3546fcb1b0859be7aa'
            '2031e952d1d1d6cb4c2ff2b879421149f3f0780ca5d3ac03bc9c23fcbbd053d6'
            '2b6134997e55ce5ef5014dc266cda71b763949ad683d321246a5143333dd1fa0')
DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe -R '*beta*.exe' %u')
# DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe %u')

package() {
  # unpack NSIS installer .exe into destination
  7z x "${pkgname}_v${pkgver}.exe" -x'!$PLUGINSDIR' -x'!$R0' -x'!icons' \
    -x'!foobar2000 Shell Associations Updater.exe' -o"${pkgdir}/usr/share/${pkgname}"

  # correct filesystem permissions
  find "${pkgdir}" -type d -execdir chmod 755 {} +

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

# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=foobar2000
pkgver=1.6.5
pkgrel=1
pkgdesc="An advanced freeware audio player (uses Wine)"
arch=(i686 x86_64)
url=http://www.foobar2000.org
license=(custom)
depends=(wine desktop-file-utils)
makedepends=(p7zip wget)
source=("foobar2000_v$pkgver.exe::https://www.foobar2000.org/download"
        "LICENSE"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
install="${pkgname}.install"
sha256sums=('829786928a64240a79e757f5e005fd7aeed34f4ed218f6908d16274122d28c25'
            '134cf36d7631628bfa4a3830704aa6a9efb6e265660b31d5b487df97aaa32721'
            '99090a8094887dbd3f59dd988db0fdac21d3ceddad5fe03342b12054202458ef'
            '2031e952d1d1d6cb4c2ff2b879421149f3f0780ca5d3ac03bc9c23fcbbd053d6'
            '2b6134997e55ce5ef5014dc266cda71b763949ad683d321246a5143333dd1fa0')
DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe -R '*beta*.exe' %u')
# DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe %u')

package() {
  # unpack NSIS installer .exe into destination
  7z x "${pkgname}_v${pkgver}.exe" -x'!$PLUGINSDIR' -x'!$R0' -x'!icons' \
    -x'!foobar2000 Shell Associations Updater.exe' \
    -o"${pkgdir}/usr/share/${pkgname}"

  # correct filesystem permissions
  find "${pkgdir}" -type d -execdir chmod 755 {} +

  # run foobar2000 in portable mode
  touch "${pkgdir}/usr/share/${pkgname}/portable_mode_enabled"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 ${pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim: set ts=2 sw=2 et:

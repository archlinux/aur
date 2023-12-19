# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=foobar2000
pkgver=2.1
pkgrel=1
pkgdesc="An advanced freeware audio player (uses Wine)"
arch=(i686 x86_64)
url=https://www.foobar2000.org
license=(custom)
depends=(wine desktop-file-utils)
makedepends=(p7zip wget)
# source_i686=("foobar2000_v$pkgver.exe::${url}/download")
# source_x86_64=("foobar2000-x64_v$pkgver.exe::${url}/download")
source=("foobar2000_v$pkgver.exe::${url}/download"
        "LICENSE"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
install=$pkgname.install
sha256sums=('61759ceb561f6a4f8960cb566c0f425ae4aff80170ba54ac2cce5e20e284eec5'
            '134cf36d7631628bfa4a3830704aa6a9efb6e265660b31d5b487df97aaa32721'
            'e9d1f7a8dc182f780d0fb15818c2837ebe0b70abcbef1c849a4185da7c09be7c'
            '2031e952d1d1d6cb4c2ff2b879421149f3f0780ca5d3ac03bc9c23fcbbd053d6'
            '2b6134997e55ce5ef5014dc266cda71b763949ad683d321246a5143333dd1fa0')
# sha256sums_i686=('bd6aab01d782680f6eb481fa72d5fab474b45bb76b225708eabc9b3c2456332b')
# sha256sums_x86_64=('91a7ec18a2a35c89b9cce027695a63831e1388047010561f3a0b30c7cfd3994c')
DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe -R '*beta*.exe' -R '*arm*' %u')
# DLAGENTS=('https::/usr/bin/wget -nH --cut-dirs=3 -r -l 2 -A exe %u')

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    # _source_exe="${pkgname}-x64_v${pkgver}.exe"
    # 7z can't open the new 64bit executable yet so for now we'll keep using
    # the legacy 32bit even on 64bit systems
    _source_exe="${pkgname}_v${pkgver}.exe"
  else
    _source_exe="${pkgname}_v${pkgver}.exe"
  fi

  # unpack NSIS installer .exe into destination
  7z x "${_source_exe}" -x'!$PLUGINSDIR' -x'!$R0' -x'!icons' \
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

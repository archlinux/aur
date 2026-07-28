# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=foobar2000
pkgver=2.25.10
pkgrel=1
pkgdesc="An advanced freeware audio player (uses Wine)"
arch=(aarch64 i686 x86_64)
url=https://www.foobar2000.org
license=(custom)
depends=(wine desktop-file-utils)
makedepends=(7zip wget)
source_aarch64=("foobar2000-arm64ec_v$pkgver.exe::${url}/foobar2000-arm64ec_v${pkgver}.exe")
source_i686=("foobar2000_v$pkgver.exe::${url}/files/${pkgname}_v${pkgver}.exe")
source_x86_64=("foobar2000-x64_v$pkgver.exe::${url}/files/${pkgname}-x64_v${pkgver}.exe")
source=("LICENSE"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
install=$pkgname.install
sha256sums=('134cf36d7631628bfa4a3830704aa6a9efb6e265660b31d5b487df97aaa32721'
            'e9d1f7a8dc182f780d0fb15818c2837ebe0b70abcbef1c849a4185da7c09be7c'
            '2031e952d1d1d6cb4c2ff2b879421149f3f0780ca5d3ac03bc9c23fcbbd053d6'
            '2b6134997e55ce5ef5014dc266cda71b763949ad683d321246a5143333dd1fa0')
sha256sums_aarch64=('de26b6d1c170a2ad7fb4e90bb654eb098740a350200e78115f769f1d59977058')
sha256sums_i686=('2a9cd51e0b5309c95db578257904ee4a6c59a61167074e9f56e43658c74984d9')
sha256sums_x86_64=('530e6c9db829874bc250af038c1d07f8b42fef61c5dd99f7edcde6393a93ee23')

package() {
  if [[ $CARCH == x86_64 ]]; then
    _source_exe="${pkgname}-x64_v${pkgver}.exe"
  elif [[ $CARCH == aarch64 ]]; then
    _source_exe="${pkgname}-arm64ec_v${pkgver}.exe"
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

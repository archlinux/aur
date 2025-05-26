# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1748236978
pkgrel=2
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
# lsof: need for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')
provides=(vscode)
options=(!strip)

source=(${_pkgname}.desktop ${_pkgname}-url-handler.desktop ${_pkgname}-bin.sh)
source_x86_64=(code_x64_1748236978.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/87d1648dbf341e534dadb49b3c4e313f29ebd551/code-insider-x64-1748236978.tar.gz)
source_aarch64=(code_arm64_1748237279.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/87d1648dbf341e534dadb49b3c4e313f29ebd551/code-insider-arm64-1748237279.tar.gz)
source_armv7h=(code_armhf_1748237389.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/87d1648dbf341e534dadb49b3c4e313f29ebd551/code-insider-armhf-1748237389.tar.gz)

sha256sums=('381bcf5644e7fba645537215f5d488b25fc9ee1509d19226f031071a6abb3bdd'
            'b961802b4f27ae8f871f64a1435dd93ee17fc72f78137bf6cc3f6aa1b107105d'
            '44c99cf30f0ae3ea32c6176b86265cf6c8044de4497b6b45b0c912b5ad5b004c')
sha256sums_x86_64=('8d7586858b32dd5fc1192dc166f5ffe44b74abf9f82346f6273bc5ca2d9eae09')
sha256sums_aarch64=('7dcb81e0ead894421a284fb1219f6ad29648e1044876d5456b06359a771d5bcc')
sha256sums_armv7h=('938e1e2c06b695a5f618671c4fbac7a6168b30e69e68434c46c4b23a0ac1efa8')

package() {
  _pkg=VSCode-linux-x64
  if [ "${CARCH}" = "aarch64" ]; then
    _pkg=VSCode-linux-arm64
  fi
  if [ "${CARCH}" = "armv7h" ]; then
    _pkg=VSCode-linux-armhf
  fi
  if [ "${CARCH}" = "i686" ]; then
    _pkg=VSCode-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/"{licenses/${_pkgname},applications,pixmaps}
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code-insiders"
}

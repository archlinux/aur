# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1747983148
pkgrel=4
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
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-x64/insider)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-arm64/insider)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-armhf/insider)

sha256sums=('381bcf5644e7fba645537215f5d488b25fc9ee1509d19226f031071a6abb3bdd'
            'b961802b4f27ae8f871f64a1435dd93ee17fc72f78137bf6cc3f6aa1b107105d'
            '44c99cf30f0ae3ea32c6176b86265cf6c8044de4497b6b45b0c912b5ad5b004c')
sha256sums_x86_64=('da02027f5df11d59bd70735540e4ff82ad696ff89621b2e800c0db0edd8c6217')
sha256sums_aarch64=('6a023f8d7d387a66a0493255860faa6e8225ab91cb2605b8634066497610abd5')
sha256sums_armv7h=('e7a526c0be8d229cc3a92d56f41dd9a6c9a8b161d2ca69f1c4644e81a08e14ec')

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

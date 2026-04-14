# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1776187469
pkgrel=1
pkgdesc="Visual Studio Code Insiders (vscode): Editor for building and debugging modern web and cloud applications (official binary version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('code-insiders' 'vscode-insiders')
conflicts=('code-insiders')
# Upstream has signature verification for extensions and stripping breaks it
# See https://github.com/microsoft/vscode/issues/223455#issuecomment-2610001754
options=(!strip)
install=$pkgname.install
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync'
             # See https://github.com/MicrosoftDocs/live-share/issues/4650
            'icu69: Needed for live share' )
source=(code-${pkgver}.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/master/resources/linux/code.desktop
        code-${pkgver}-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/master/resources/linux/code-url-handler.desktop
        code-${pkgver}-workspace.xml.in::https://raw.githubusercontent.com/microsoft/vscode/master/resources/linux/code-workspace.xml
        ${_pkgname}-bin.sh)
source_x86_64=(code_x64_1776187469.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/98b4d3e24443f6566e694021a376e1760c4a7f62/code-insider-x64-1776187469.tar.gz)
source_aarch64=(code_arm64_1776187485.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/98b4d3e24443f6566e694021a376e1760c4a7f62/code-insider-arm64-1776187485.tar.gz)
source_armv7h=(code_armhf_1776187478.tar.gz::https://vscode.download.prss.microsoft.com/dbazure/download/insider/98b4d3e24443f6566e694021a376e1760c4a7f62/code-insider-armhf-1776187478.tar.gz)

sha256sums=('2f1782b30c4e040efff655fd9cf477930c5a0c81ddae27749b0cbb922c1d248e'
            'c361efa7e02fcad759ed80d2fbab67877f33219b981578af6fffaf18aeb12d9b'
            '3af748dd6578a1775e8eb7248ba397b7e11840df2ea6ee234ff76fee3dc306cf'
            '4ba4e7bb90c05089a2aed7e1fbfade57f6878aebe8c3166c82dcaefc45141372')
sha256sums_x86_64=('a2a5fc5deadaf27ad77523f9072e4e713d6a3682e9cf587c114688ee66011e6e')
sha256sums_aarch64=('83569ecf19ef06bf4d9ee57f1b066a8f59e7fc46f3aeb23e251019cf1be63535')
sha256sums_armv7h=('425724bad27061bb46cb5be1fb941b5967a487af1dbbd78c41a70f36e51f922d')

_set_meta_info() {
  sed 's/@@NAME_LONG@@/Visual Studio Code Insiders/g' "$1" |\
  sed 's/@@NAME_SHORT@@/code - insiders/g' |\
  sed 's/@@NAME@@/code/g' |\
  sed 's#@@EXEC@@#/usr/bin/code-insiders#g' |\
  sed 's/@@ICON@@/visual-studio-code-insiders/g' |\
  sed 's/@@URLPROTOCOL@@/vscode-insiders/g'
}

prepare() {
  _set_meta_info "${srcdir}/code-${pkgver}.desktop.in" > "${srcdir}/code.desktop"
  _set_meta_info "${srcdir}/code-${pkgver}-url-handler.desktop.in" > "${srcdir}/code-url-handler.desktop"
  _set_meta_info "${srcdir}/code-${pkgver}-workspace.xml.in" > "${srcdir}/code-workspace.xml"
}

_pkg() {
  if [ "${CARCH}" = "aarch64" ]; then
    echo 'VSCode-linux-arm64'
  elif [ "${CARCH}" = "armv7h" ]; then
    echo 'VSCode-linux-armhf'
  else
    echo 'VSCode-linux-x64'
  fi
}

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/"{applications,pixmaps,mime/packages,licenses/${_pkgname}}

  install -m644 "${srcdir}/$(_pkg)/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/$(_pkg)/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -m644 "${srcdir}/code.desktop" "${pkgdir}/usr/share/applications/code-insiders.desktop"
  install -m644 "${srcdir}/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-insiders-url-handler.desktop"
  install -m644 "${srcdir}/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-insiders-workspace.xml"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/bash/code-insiders" "${pkgdir}/usr/share/bash-completion/completions/code-insiders"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/zsh/_code-insiders" "${pkgdir}/usr/share/zsh/site-functions/_code-insiders"

  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code-insiders"
}

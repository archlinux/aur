# Maintainer: Javad <ja7ad@live.com>
# This file followed aur pkg D. Can Celasun <can[at]dcc[dot]im>.
# Live stream package auto update

pkgname=visual-studio-code-live-bin
_pkgname=visual-studio-code
pkgver=1.112.0
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (live binary version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('code' 'vscode')
conflicts=('code')

options=(!strip)
install=$pkgname.install
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib)
optdepends=('glib2: Needed for move to trash functionality')
source=(code-${pkgver}.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code.desktop
        code-${pkgver}-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-url-handler.desktop
        code-${pkgver}-workspace.xml.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-workspace.xml
        ${_pkgname}-live-bin.sh)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-x64/stable)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-arm64/stable)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-armhf/stable)

_set_meta_info() {
  sed 's/@@NAME_LONG@@/Visual Studio Code/g' "$1" |\
  sed 's/@@NAME_SHORT@@/Code/g' |\
  sed 's/@@NAME@@/code/g' |\
  sed 's#@@EXEC@@#/usr/bin/code#g' |\
  sed 's/@@ICON@@/visual-studio-code/g' |\
  sed 's/@@URLPROTOCOL@@/vscode/g'
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
  install -m644 "${srcdir}/code.desktop" "${pkgdir}/usr/share/applications/code.desktop"
  install -m644 "${srcdir}/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-url-handler.desktop"
  install -m644 "${srcdir}/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/bash/code" "${pkgdir}/usr/share/bash-completion/completions/code"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/zsh/_code" "${pkgdir}/usr/share/zsh/site-functions/_code"

  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
	install -m755 "${srcdir}/${_pkgname}-live-bin.sh" "${pkgdir}/usr/bin/code"
}

sha256sums=('2f1782b30c4e040efff655fd9cf477930c5a0c81ddae27749b0cbb922c1d248e'
            'c361efa7e02fcad759ed80d2fbab67877f33219b981578af6fffaf18aeb12d9b'
            '3af748dd6578a1775e8eb7248ba397b7e11840df2ea6ee234ff76fee3dc306cf'
            '8e8ab26763ae73f6d3fc4ba393febf999b93b96354194de2ffac2ae93a96cf41')
sha256sums_x86_64=('5728ea3d3c8b9fc78687f5d2de79f43ccaa202cacbf75bc3643e99f4bda8876e')
sha256sums_aarch64=('c3288ebc734cb84e926c89d82bdbe561591b7710257fdff11dada729687c79c7')
sha256sums_armv7h=('84002e60aed9406a4040b13da3cfc617ea871e3d0e7d3d7921763d72f68a042d')

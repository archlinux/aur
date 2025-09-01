# Maintainer: Kimiblock Moe

# Original PKGBUILD from: aur/visual-studio-code-bin

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-portable
_pkgname=visual-studio-code
pkgver=1.103.2
pkgrel=1
pkgdesc="Visual Studio Code, sandboxed by portable."
arch=('x86_64' 'aarch64')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('code' 'vscode')
conflicts=('code')
options=(!strip)
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib portable icu69 org.freedesktop.secrets)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')
source=(code-${pkgver}.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code.desktop
        code-${pkgver}-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-url-handler.desktop
	code-${pkgver}-workspace.xml.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-workspace.xml
        start.sh
	portable-config
	)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-x64/stable)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-arm64/stable)

sha256sums=('2f1782b30c4e040efff655fd9cf477930c5a0c81ddae27749b0cbb922c1d248e'
            'c361efa7e02fcad759ed80d2fbab67877f33219b981578af6fffaf18aeb12d9b'
            '3af748dd6578a1775e8eb7248ba397b7e11840df2ea6ee234ff76fee3dc306cf'
            '9dc32f5c87bf681059b4fb3f750fe3d0b4672655e4d84ae44bf25a6f5b3bb142'
            '83ab349fc824e818ed9c2b13da197994f6b5183fdd4af111883bbfd92fedc6c2')
sha256sums_x86_64=('be59af3e4da58f07439251b281dc66b6874fcc607e80d8f011a695a7737e7d02')
sha256sums_aarch64=('dba41f9c1626d51c7551dce4e1db6934e512a6e0eaa489229afd10964727b008')

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
  #install -m644 "${srcdir}/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-url-handler.desktop"
  install -m644 "${srcdir}/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
	install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/code"
	install -m644 "${srcdir}/code.desktop" "${pkgdir}/usr/share/applications/com.visualstudio.code.desktop"
	install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/com.visualstudio.code/config"
}


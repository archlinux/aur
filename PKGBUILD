# Mantainer: marmis <tiagodepalves@gmail.com>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>

_pkgname=visual-studio-code
pkgname=${_pkgname}-bin-patched
pkgver=1.92.2
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (binary version, with patches for XDG spec)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=(LicenseRef-MicrosoftSoftwareLicentsTerms) # https://code.visualstudio.com/license
provides=('code' 'vscode')
conflicts=('code')
install=${pkgname}.install
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync'
             # See https://github.com/MicrosoftDocs/live-share/issues/4650
            'icu69: Needed for live share' )
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-x64/stable)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-arm64/stable)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-armhf/stable)
source=(code.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code.desktop
        code-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-url-handler.desktop
        code-workspace.xml.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-workspace.xml
        ${_pkgname}-bin.sh
        vscode-15741.patch
        vscode-129953.patch)

# This generates cleaner checksums
sha256sums=('dc64d1c6bb4a0cb2aae24dcd2d742178428f2849dab60074194e5603d32be745'
            'c361efa7e02fcad759ed80d2fbab67877f33219b981578af6fffaf18aeb12d9b'
            '3af748dd6578a1775e8eb7248ba397b7e11840df2ea6ee234ff76fee3dc306cf'
            'bbaeb9ad1f77e145ce5fe6c3c9d1cda2052b0989559fee0df40a1f35c08870e5'
            '56a43479c7d4d4967acb8675a3be8e30211ea1192530ca4af539ee111771d6db'
            '29988ffb0c2ec761f0cc7c466f97831ff552b47425c2c69fc02aedd8cbc30445')
sha256sums_x86_64=('736eb24f77f47d4173c094e2314b04527bbc0ad73928c488341413a200b1d34d')
sha256sums_aarch64=('f2132815e9f74cb829799c1c92478b9244dabdf01383e8bb38c9b1630ef5280b')
sha256sums_armv7h=('92f7855f1ae13f7879e196845fe24e38e76cdf5869e2d1881f58ab2350044565')


_set_meta_info() {
  sed 's/@@NAME_LONG@@/Visual Studio Code/g' "$1" |\
    sed 's/@@NAME_SHORT@@/Code/g' |\
    sed 's/@@NAME@@/code/g' |\
    sed 's#@@EXEC@@#/usr/bin/code#g' |\
    sed 's/@@ICON@@/visual-studio-code/g' |\
    sed 's/@@URLPROTOCOL@@/vscode/g'
}

_pkg() {
  if [ "${CARCH}" = "aarch64" ]; then
    echo 'VSCode-linux-arm64'
  elif [ "${CARCH}" = "armv7h" ]; then
    echo 'VSCode-linux-armhf'
  elif [ "${CARCH}" = "i686" ]; then
    echo 'VSCode-linux-ia32'
  else
    echo 'VSCode-linux-x64'
  fi
}

prepare() {
  _set_meta_info "${srcdir}/code.desktop.in" > "${srcdir}/code.desktop"
  _set_meta_info "${srcdir}/code-url-handler.desktop.in" > "${srcdir}/code-url-handler.desktop"
  _set_meta_info "${srcdir}/code-workspace.xml.in" > "${srcdir}/code-workspace.xml"

  patch -d "${srcdir}" -p1 < "${srcdir}/vscode-15741.patch"
  patch -d "${srcdir}/$(_pkg)" -p1 < "${srcdir}/vscode-129953.patch"
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/$(_pkg)/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/$(_pkg)/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/code.desktop" "${pkgdir}/usr/share/applications/code.desktop"
  install -m644 "${srcdir}/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-url-handler.desktop"
  install -m644 "${srcdir}/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/code-workspace.xml"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/bash/code" "${pkgdir}/usr/share/bash-completion/completions/code"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/zsh/_code" "${pkgdir}/usr/share/zsh/site-functions/_code"

  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code"
}

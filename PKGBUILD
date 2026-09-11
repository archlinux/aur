# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1789113165
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
source=(${_pkgname}-bin.sh)
source_x86_64=(code_x64_1789113165.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/60ac69b364809ee6976d6dc3ed74cc7628f637da/code-insiders_1.138.0-1789113165_amd64.deb)
source_aarch64=(code_arm64_1789113171.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/60ac69b364809ee6976d6dc3ed74cc7628f637da/code-insiders_1.138.0-1789113171_arm64.deb)
source_armv7h=(code_armhf_1789113038.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/60ac69b364809ee6976d6dc3ed74cc7628f637da/code-insiders_1.138.0-1789113038_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('720f6e6db107d1092a860e867b7f8fa4a1067f71aa75b236e1aebec459815fad')
sha256sums_aarch64=('499e2cfda7459fab93f560ebe6d88c69b994de82d82b8b6c26a9783de2abb701')
sha256sums_armv7h=('beb9e8ee38c6002e1cfafbd59f56b6c650cb5e4eea1d35de5c76c39fe170371c')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /usr/share/code-insiders/resources/app/LICENSE.rtf \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code-insiders"

  # Fix the desktop entries
  sed -i \
    -e 's/^\(Exec=\)[^ ]*/\1code-insiders/g' \
    "${pkgdir}"/usr/share/applications/*.desktop

  # setuid on chrome-sandbox
  # Comment out if using a kernel without user namespaces, like linux-hardened
  chmod u-s "${pkgdir}/usr/share/code-insiders/chrome-sandbox"
}

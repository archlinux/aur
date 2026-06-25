# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1782422110
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
source_x86_64=(code_x64_1782422110.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3161b0d4062e57cece92760e0260ff6030ac7777/code-insiders_1.127.0-1782422110_amd64.deb)
source_aarch64=(code_arm64_1782422112.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3161b0d4062e57cece92760e0260ff6030ac7777/code-insiders_1.127.0-1782422112_arm64.deb)
source_armv7h=(code_armhf_1782422004.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3161b0d4062e57cece92760e0260ff6030ac7777/code-insiders_1.127.0-1782422004_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('2e373b92f09669277f9ab1418481d76131aa2da9c3c7cb1af7c090f0acc4f7ce')
sha256sums_aarch64=('959fd4f9b65c150fdca5f7aeae5413d6e9f7577799ac268f9fc5945d9afd6fdd')
sha256sums_armv7h=('a9b545ff76f0eb81827445ec3f6dc8dbc218b0fa8c427feaec681778ad324f91')

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

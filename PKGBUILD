# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784653908
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
source_x86_64=(code_x64_1784653908.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7465d6f56c9afb8ed3696a9eaeb4f3f6d62156d/code-insiders_1.131.0-1784653908_amd64.deb)
source_aarch64=(code_arm64_1784653896.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7465d6f56c9afb8ed3696a9eaeb4f3f6d62156d/code-insiders_1.131.0-1784653896_arm64.deb)
source_armv7h=(code_armhf_1784653770.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7465d6f56c9afb8ed3696a9eaeb4f3f6d62156d/code-insiders_1.131.0-1784653770_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('9ba99d7beba7ed1aa37e981d90b5ee77515f78f13e6240173828b86c0af92dbd')
sha256sums_aarch64=('865d5821bee85a745e9a34bc1d4bd8f11753351168f148ce14f9b9b24665605e')
sha256sums_armv7h=('590d5bddeb3b530d9af342a1a01b32daae6c12ab4f1010287fa85141c9561083')

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

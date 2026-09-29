# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1790633624
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
source_x86_64=(code_x64_1790633624.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/2dfd3b41fbc30a7270f0b84db51d67ab7568ebe3/code-insiders_1.140.0-1790633624_amd64.deb)
source_aarch64=(code_arm64_1790633618.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/2dfd3b41fbc30a7270f0b84db51d67ab7568ebe3/code-insiders_1.140.0-1790633618_arm64.deb)
source_armv7h=(code_armhf_1790633474.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/2dfd3b41fbc30a7270f0b84db51d67ab7568ebe3/code-insiders_1.140.0-1790633474_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('782369419470d9ba80476a050264eb44898c2664b94ccdb27ea2f5cc970bcc75')
sha256sums_aarch64=('eac3e35128f0ee246a476865b4dff8580c8bc2a2d41693e59504471cc507e809')
sha256sums_armv7h=('3e148c10f96e20235ed0004d35578c9570e3a8a91e4610ab43f509233b8be4ab')

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

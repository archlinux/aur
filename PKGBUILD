# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781198741
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
source_x86_64=(code_x64_1781198741.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d420356ab9998a711c36d7c51a2d7d2c91c73a87/code-insiders_1.125.0-1781198741_amd64.deb)
source_aarch64=(code_arm64_1781198720.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d420356ab9998a711c36d7c51a2d7d2c91c73a87/code-insiders_1.125.0-1781198720_arm64.deb)
source_armv7h=(code_armhf_1781198626.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d420356ab9998a711c36d7c51a2d7d2c91c73a87/code-insiders_1.125.0-1781198626_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('b6169ffaaffee08e560d4b9c5b0f308ec10bcff4f066f3be7e99878a70ea4ec6')
sha256sums_aarch64=('38769b6eeb36c8e5bd290715e065e184a9c7b1965a33423566067fec5fcf9b1c')
sha256sums_armv7h=('3ebfea59945f208e28ceb51f750773eb105f356359a98f3cb51285c5f866e8cd')

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

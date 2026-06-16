# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781568225
pkgrel=2
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
source_x86_64=(code_x64_1781568225.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/93cfdd489c3b228840d0f86ec77c3636277c93ea/code-insiders_1.125.0-1781568225_amd64.deb)
source_aarch64=(code_arm64_1781568190.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/93cfdd489c3b228840d0f86ec77c3636277c93ea/code-insiders_1.125.0-1781568190_arm64.deb)
source_armv7h=(code_armhf_1781568053.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/93cfdd489c3b228840d0f86ec77c3636277c93ea/code-insiders_1.125.0-1781568053_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('07d4dae636b39e98555f6ac99cda16b41994af17cb2a1cd98a3425a1c87682d3')
sha256sums_aarch64=('533dfd30afc39c66b776f6327190fecdb238d540d0f0aa5a3277f64bc7ab9125')
sha256sums_armv7h=('1ede880e1fff0f6eb44aee77b6d76425ee22f89d146ac6c19858f9b793aaeb49')

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

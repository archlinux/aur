# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1794385035
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
            'icu69: Needed for live share'
            # See https://code.visualstudio.com/docs/agents/run/agent-sandboxing#_check-platform-availability
            'bubblewrap: Agent host sandboxing' 'socat: Agent host sandboxing'
            )
source=(${_pkgname}-bin.sh)
source_x86_64=(code_x64_1794385035.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/07282098047bad970657000c946edf604f4602fe/code-insiders_1.147.0-1794385035_amd64.deb)
source_aarch64=(code_arm64_1794384925.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/07282098047bad970657000c946edf604f4602fe/code-insiders_1.147.0-1794384925_arm64.deb)
source_armv7h=(code_armhf_1794384494.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/07282098047bad970657000c946edf604f4602fe/code-insiders_1.147.0-1794384494_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('5f68168e14c78aaa504f85a9311102c9272cfb9466f3de153dde3c13b24ec753')
sha256sums_aarch64=('72e5cd147d92addc654de7da0dfab342eb853a6898072ebbbe8a34629bd1b561')
sha256sums_armv7h=('b29fa019e3ababec4438b62c8c8e199d052a87196b6cd67e6b3e837a75440d7e')

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

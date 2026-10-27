# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1793121876
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
source_x86_64=(code_x64_1793121876.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3797664749856829367927a93d65834507e4d12/code-insiders_1.145.0-1793121876_amd64.deb)
source_aarch64=(code_arm64_1793121819.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3797664749856829367927a93d65834507e4d12/code-insiders_1.145.0-1793121819_arm64.deb)
source_armv7h=(code_armhf_1793121441.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3797664749856829367927a93d65834507e4d12/code-insiders_1.145.0-1793121441_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('ec753ecf4b1659bc42191059d7f2f628371760b9b7ea8e75b61341b67be62c7e')
sha256sums_aarch64=('d24ad4c1387fed44771bbe399ee151a030e00fd25ac38770e5e14f3ad088fee3')
sha256sums_armv7h=('157ee7adc16992bf4749827a0ea981183528a8bd9c429ab6a4a45a2b9595ef77')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1794433052
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
source_x86_64=(code_x64_1794433052.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5618b3eb24e32b51b220bea95137541221f7fad0/code-insiders_1.147.0-1794433052_amd64.deb)
source_aarch64=(code_arm64_1794432898.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5618b3eb24e32b51b220bea95137541221f7fad0/code-insiders_1.147.0-1794432898_arm64.deb)
source_armv7h=(code_armhf_1794432481.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5618b3eb24e32b51b220bea95137541221f7fad0/code-insiders_1.147.0-1794432481_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('ad0c899b3c3c2e115b4baecf4f04da5600bbe9328d8e39639d70fd44dd7051d9')
sha256sums_aarch64=('a78771e16eb486c8c940b8c1104a1bb9720ad1cad6f558ebf63ae91fa1ad618c')
sha256sums_armv7h=('9a4bc9930a95f01b0f49bbcbacec41ba8ae97fbdce2ec10d263c0837be07f0bc')

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

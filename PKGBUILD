# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1792042638
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
source_x86_64=(code_x64_1792042638.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9ebdca5c15f666ab336ca0b0421f5ee25bf1cbe0/code-insiders_1.143.0-1792042638_amd64.deb)
source_aarch64=(code_arm64_1792042477.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9ebdca5c15f666ab336ca0b0421f5ee25bf1cbe0/code-insiders_1.143.0-1792042477_arm64.deb)
source_armv7h=(code_armhf_1792042104.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9ebdca5c15f666ab336ca0b0421f5ee25bf1cbe0/code-insiders_1.143.0-1792042104_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('014e49f7d98ed4d6a164881d6a8c9d86c096e994020653b1dea2d92f3164501a')
sha256sums_aarch64=('b25aa856be99b24be21f1de8dbbfbd3864afbf995c78dfc80f21b2530b98bc9f')
sha256sums_armv7h=('a1391355efdec4834f0d3f66563d76aa532f90025cb899c44a44d396ec8ac4a5')

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

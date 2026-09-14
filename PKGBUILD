# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1789320271
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
source_x86_64=(code_x64_1789320271.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b065ad9cd83dae266607baf77f10c1fbf0330fba/code-insiders_1.138.0-1789320271_amd64.deb)
source_aarch64=(code_arm64_1789320253.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b065ad9cd83dae266607baf77f10c1fbf0330fba/code-insiders_1.138.0-1789320253_arm64.deb)
source_armv7h=(code_armhf_1789320118.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b065ad9cd83dae266607baf77f10c1fbf0330fba/code-insiders_1.138.0-1789320118_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('9b3c53bb97d02c7a74ac1a2a19ba3d8bde0fd64f9f9df01481f9c2dd0d926df6')
sha256sums_aarch64=('c80c026dbc8eaa4c2923d285c9c083362a15844f8916fc274e165f9d6460f22d')
sha256sums_armv7h=('14cfa0ceedb89b52fcb4f2c80e64dac0854dae6b3784e3f5b1db269bd846d59d')

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

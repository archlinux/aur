# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1787116458
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
source_x86_64=(code_x64_1787116458.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a1c7d1be7ebeddac39ee87a311d940b04b2e5da2/code-insiders_1.135.0-1787116458_amd64.deb)
source_aarch64=(code_arm64_1787116367.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a1c7d1be7ebeddac39ee87a311d940b04b2e5da2/code-insiders_1.135.0-1787116367_arm64.deb)
source_armv7h=(code_armhf_1787116194.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a1c7d1be7ebeddac39ee87a311d940b04b2e5da2/code-insiders_1.135.0-1787116194_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('7fca375aeb9d6c046621620d33985c06628080835d634bc50f40d9eab1863f34')
sha256sums_aarch64=('6e6bf9bbfb4a7770898fc01c87c355c53f4ee3bd2d45c7893ce708daafbd4a89')
sha256sums_armv7h=('5710831a7188275e744c61aa66b50d1ad3a3545394348e3d8440172068a70d7b')

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

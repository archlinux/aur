# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1788952689
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
source_x86_64=(code_x64_1788952689.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/1f398ff5fa56ae9b782dc3a55856562233efd72e/code-insiders_1.138.0-1788952689_amd64.deb)
source_aarch64=(code_arm64_1788952904.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/1f398ff5fa56ae9b782dc3a55856562233efd72e/code-insiders_1.138.0-1788952904_arm64.deb)
source_armv7h=(code_armhf_1788952534.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/1f398ff5fa56ae9b782dc3a55856562233efd72e/code-insiders_1.138.0-1788952534_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('56496ea48360a0d7a585d0024ee8c7294c3867d312a7ff438d4cc9aab2feb476')
sha256sums_aarch64=('3cac9db7978fd76fc77b0903746164af87d2772ecf4e245df72d93bed0fa3344')
sha256sums_armv7h=('c81e102bd944a282f827e8d06fd8623d6171f9432a389a03c5db5e583b32d874')

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

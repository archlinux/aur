# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1783317769
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
source_x86_64=(code_x64_1783317769.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/86df0e5dc86a78298b5ffce1c6f6793ad79c3e93/code-insiders_1.128.0-1783317769_amd64.deb)
source_aarch64=(code_arm64_1783317753.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/86df0e5dc86a78298b5ffce1c6f6793ad79c3e93/code-insiders_1.128.0-1783317753_arm64.deb)
source_armv7h=(code_armhf_1783317585.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/86df0e5dc86a78298b5ffce1c6f6793ad79c3e93/code-insiders_1.128.0-1783317585_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('8d2707dc9a1e5b9493dc8d90b1f851ec32f29fd59905dcec5ffa58e1184a432e')
sha256sums_aarch64=('8c87c71eed62596c2a4e859531025c4cb85554ce7d7b47e8d11c2e1f7092f23c')
sha256sums_armv7h=('91d4886387ab0794f9740ffd25eaa1beb5c928b90a8280c8c8c5ed746183a127')

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

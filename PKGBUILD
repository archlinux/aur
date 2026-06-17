# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781730844
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
source_x86_64=(code_x64_1781730844.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5dce713a208a8abddb486ad9d9b405bbe59a2eec/code-insiders_1.126.0-1781730844_amd64.deb)
source_aarch64=(code_arm64_1781730702.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5dce713a208a8abddb486ad9d9b405bbe59a2eec/code-insiders_1.126.0-1781730702_arm64.deb)
source_armv7h=(code_armhf_1781730619.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5dce713a208a8abddb486ad9d9b405bbe59a2eec/code-insiders_1.126.0-1781730619_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('d875f35c7a93427da6511a054f5d88d252681696915d06b1fb447535d187801c')
sha256sums_aarch64=('1f6b7005cdcb16e7f353b11dd348b57c95a7ec3f337dc370a13a548ba42ddedd')
sha256sums_armv7h=('6b696a28457a3c079368103e39da87a1c277f276b5181215009ab4830e5f1391')

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

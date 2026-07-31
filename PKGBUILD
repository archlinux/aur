# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1785475140
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
source_x86_64=(code_x64_1785475140.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1ced2b15b280d2cf7a77b12baafaf5e68f7076c/code-insiders_1.132.0-1785475140_amd64.deb)
source_aarch64=(code_arm64_1785475145.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1ced2b15b280d2cf7a77b12baafaf5e68f7076c/code-insiders_1.132.0-1785475145_arm64.deb)
source_armv7h=(code_armhf_1785474997.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1ced2b15b280d2cf7a77b12baafaf5e68f7076c/code-insiders_1.132.0-1785474997_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('7afa62abe78159b49b30a96b693732bf073905b0b64287c72ab70f692a94c48f')
sha256sums_aarch64=('1ef33f4af97ae8e21aa17a1b13bb5986719e001684a3db74210a6d6c46146e7f')
sha256sums_armv7h=('a1ec210bb4cd5abfcabbaaa42ae34e5b695086547c8e7cf5c8c5f4e58164639d')

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

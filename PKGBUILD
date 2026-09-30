# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1790767712
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
source_x86_64=(code_x64_1790767712.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/73d5322bb28c1a3c449fcee6c3869af33fad5027/code-insiders_1.141.0-1790767712_amd64.deb)
source_aarch64=(code_arm64_1790767694.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/73d5322bb28c1a3c449fcee6c3869af33fad5027/code-insiders_1.141.0-1790767694_arm64.deb)
source_armv7h=(code_armhf_1790767348.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/73d5322bb28c1a3c449fcee6c3869af33fad5027/code-insiders_1.141.0-1790767348_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('480a52938615982567036d7ce9208e28f29b0f0302fd7497865701ef6f1bf551')
sha256sums_aarch64=('6b71f0b0b875dd0d8bd15a0ec110b20ef658798f8d6ae1ed1c643b0029a89b05')
sha256sums_armv7h=('325c102481f11b75938709487c9ebeaec56db027577eb022aee12c83d1ef86c5')

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

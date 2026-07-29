# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1785345404
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
source_x86_64=(code_x64_1785345404.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/54917b34eaaeeec2b294c43d691fc6c1e4b86c89/code-insiders_1.132.0-1785345404_amd64.deb)
source_aarch64=(code_arm64_1785345409.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/54917b34eaaeeec2b294c43d691fc6c1e4b86c89/code-insiders_1.132.0-1785345409_arm64.deb)
source_armv7h=(code_armhf_1785345285.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/54917b34eaaeeec2b294c43d691fc6c1e4b86c89/code-insiders_1.132.0-1785345285_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('8ecb263681764bc5abfa062e2eb97ace2e7f7c45119fea754d3a7dad4081a9b1')
sha256sums_aarch64=('cf3f82f168eab2ea9f41c8f52a39787521170791f078d29c61cf4eeb7cf28628')
sha256sums_armv7h=('9ab7f4a3648cc191f2de3ccc1e71c2037851982abaf1702c172c98598684de16')

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

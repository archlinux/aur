# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1791247215
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
source_x86_64=(code_x64_1791247215.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1f9096c3663d21e55cf448de012c620b960220a/code-insiders_1.141.0-1791247215_amd64.deb)
source_aarch64=(code_arm64_1791247147.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1f9096c3663d21e55cf448de012c620b960220a/code-insiders_1.141.0-1791247147_arm64.deb)
source_armv7h=(code_armhf_1791246808.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d1f9096c3663d21e55cf448de012c620b960220a/code-insiders_1.141.0-1791246808_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('9a78ac24b8f9f82a5f7d7cc692c78bd3698984c739f9512b50f955eef2b603eb')
sha256sums_aarch64=('0c758fd4c05fa8d3ef550214c7d09fe0fea0d663c3535e78ce6f5d51ceabc48e')
sha256sums_armv7h=('f10ce97daf6710a75b682fcef13f2143c5d3f76d269fb028020cbd66917f3d15')

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

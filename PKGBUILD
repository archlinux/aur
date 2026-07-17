# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784283023
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
source_x86_64=(code_x64_1784283023.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/6af4928d5e2e07f3180a59ab7f326c68e55204ee/code-insiders_1.130.0-1784283023_amd64.deb)
source_aarch64=(code_arm64_1784283000.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/6af4928d5e2e07f3180a59ab7f326c68e55204ee/code-insiders_1.130.0-1784283000_arm64.deb)
source_armv7h=(code_armhf_1784282911.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/6af4928d5e2e07f3180a59ab7f326c68e55204ee/code-insiders_1.130.0-1784282911_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('e20b0f66dfd6af9d9c4b1ccc08f0e21b2c47634e8e7c5fda6a405f9ebe443252')
sha256sums_aarch64=('fc1a729dd85544c53be87bb80d0493fcc5e565fe5b5de2f6f958ac13a9be5998')
sha256sums_armv7h=('5de3884507cbdcd6b1152b7833fa10ab30e57b8c953ba522a5cc86ff8b6e2510')

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

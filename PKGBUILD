# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1788387210
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
source_x86_64=(code_x64_1788387210.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3c780be1ff7381b665d0592052fb1c7c9e93ab6/code-insiders_1.137.0-1788387210_amd64.deb)
source_aarch64=(code_arm64_1788387209.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3c780be1ff7381b665d0592052fb1c7c9e93ab6/code-insiders_1.137.0-1788387209_arm64.deb)
source_armv7h=(code_armhf_1788387051.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/a3c780be1ff7381b665d0592052fb1c7c9e93ab6/code-insiders_1.137.0-1788387051_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('3a3a562fee49c7a7b1ba43bb85c869bc771e3a79466313ebe374f203547598ab')
sha256sums_aarch64=('8bc418b7c345ddb5e43efb19b5d6e5b961e11260b15e1aae39caa7f8ea8acdd4')
sha256sums_armv7h=('1b3d88f6a295b14b37987b8d2267d62ef17e8b5ed4c0400f31996657e1a5e789')

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

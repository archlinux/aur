# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1790684610
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
source_x86_64=(code_x64_1790684610.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/f9bb522f5746a56791aa4407a3db5c1b5cd3ad04/code-insiders_1.140.0-1790684610_amd64.deb)
source_aarch64=(code_arm64_1790684624.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/f9bb522f5746a56791aa4407a3db5c1b5cd3ad04/code-insiders_1.140.0-1790684624_arm64.deb)
source_armv7h=(code_armhf_1790684476.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/f9bb522f5746a56791aa4407a3db5c1b5cd3ad04/code-insiders_1.140.0-1790684476_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('0d6001e57c7364009771eec73dca927cccf5e15e1c662645ecca02769da62224')
sha256sums_aarch64=('b421334a2d822032653a567560fd49c42c7d008144e0e10df43475b9415d9d0e')
sha256sums_armv7h=('00554f5d1ee1c8b62e6a370776256d4af326266e4e6c70f2222944a62f968b06')

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

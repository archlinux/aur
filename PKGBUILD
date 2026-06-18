# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781815123
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
source_x86_64=(code_x64_1781815123.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/bb215ba65e18347c8bc7481ccf4b2dbb92260255/code-insiders_1.126.0-1781815123_amd64.deb)
source_aarch64=(code_arm64_1781815035.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/bb215ba65e18347c8bc7481ccf4b2dbb92260255/code-insiders_1.126.0-1781815035_arm64.deb)
source_armv7h=(code_armhf_1781814895.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/bb215ba65e18347c8bc7481ccf4b2dbb92260255/code-insiders_1.126.0-1781814895_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('9f1c0f8c150df168242dac6ca1d0b01da0cd22cc6e5a727c518a87f529ad1e7c')
sha256sums_aarch64=('d2747f30f8f861ee7cdad004cb63495df2bc5a47c03ade49b2ea6b9190a09cec')
sha256sums_armv7h=('20aa391db5a3c1fedc4dc3434f1266bacb70d4af337e7014a49abc30a56f197b')

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

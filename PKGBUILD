# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781154551
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
source_x86_64=(code_x64_1781154551.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7ce0ce923f97583f7e03f9c17a149b1601090a3/code-insiders_1.125.0-1781154551_amd64.deb)
source_aarch64=(code_arm64_1781154544.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7ce0ce923f97583f7e03f9c17a149b1601090a3/code-insiders_1.125.0-1781154544_arm64.deb)
source_armv7h=(code_armhf_1781154443.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/d7ce0ce923f97583f7e03f9c17a149b1601090a3/code-insiders_1.125.0-1781154443_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('8f65303665d111590629553537901293e9fd2462a41cb29169bc33d50b75b988')
sha256sums_aarch64=('ca675b993cbb734859eda5ec244c9683ba5fb070b4afb44914ff9e2f7b5a4823')
sha256sums_armv7h=('c98d7b443ba54e1c9c047945fb3dc7295f5c02b5020b05ca107370eb1be754e5')

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

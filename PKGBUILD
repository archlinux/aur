# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781629900
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
source_x86_64=(code_x64_1781629900.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/dd4cdfe836fb285070017f95eff22f2cecb03b49/code-insiders_1.126.0-1781629900_amd64.deb)
source_aarch64=(code_arm64_1781629892.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/dd4cdfe836fb285070017f95eff22f2cecb03b49/code-insiders_1.126.0-1781629892_arm64.deb)
source_armv7h=(code_armhf_1781629786.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/dd4cdfe836fb285070017f95eff22f2cecb03b49/code-insiders_1.126.0-1781629786_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('d8e9ffc43a76e0e3e06b3817a831d8a664adcb89bd2b1ad75746057dc708c89a')
sha256sums_aarch64=('d17e7169c6eb83836930ce0280bc862449f26021c6d5eba5a6608d26f23b0283')
sha256sums_armv7h=('3ae48703e5044b405efd2797767ad32f3eda2b2eed499775d75b65c3a8cd6803')

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

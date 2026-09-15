# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1789433539
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
source_x86_64=(code_x64_1789433539.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/37a7dda8100be458b06583283b1d7c88b787da69/code-insiders_1.138.0-1789433539_amd64.deb)
source_aarch64=(code_arm64_1789433523.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/37a7dda8100be458b06583283b1d7c88b787da69/code-insiders_1.138.0-1789433523_arm64.deb)
source_armv7h=(code_armhf_1789433386.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/37a7dda8100be458b06583283b1d7c88b787da69/code-insiders_1.138.0-1789433386_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('bfc738292593b334d09f9478a4a9e7461d2fe9bdd22837f59020fc17696c2253')
sha256sums_aarch64=('2277cfa0e5eb3d8194325af690b4d1ab8e87796cee6a95366837d5dddb8ebf0c')
sha256sums_armv7h=('ab66a775ea452471e8228375d5cf778de1fbb89538492693b46c3dcdce3765aa')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1785139281
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
source_x86_64=(code_x64_1785139281.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/45f35577f5e111c0d943da28678cfe17fac5a29a/code-insiders_1.131.0-1785139281_amd64.deb)
source_aarch64=(code_arm64_1785139277.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/45f35577f5e111c0d943da28678cfe17fac5a29a/code-insiders_1.131.0-1785139277_arm64.deb)
source_armv7h=(code_armhf_1785139155.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/45f35577f5e111c0d943da28678cfe17fac5a29a/code-insiders_1.131.0-1785139155_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('39faebec90a48e2f7713f53e86db4f9d986ef4e99640de8422a153b8bab8390a')
sha256sums_aarch64=('d21aa8f5dd29f3e0f6e1a2d53945bccc0546fbd01812c21216bf2478454972c9')
sha256sums_armv7h=('d7549650c608a3885f0ca8950d5506f213aea46879dac4e3ad54ab2c6023ee89')

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

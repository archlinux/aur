# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1787850974
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
source_x86_64=(code_x64_1787850974.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b7f76c1a312bccf8e408c485a5c0746bb27b1205/code-insiders_1.136.0-1787850974_amd64.deb)
source_aarch64=(code_arm64_1787850767.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b7f76c1a312bccf8e408c485a5c0746bb27b1205/code-insiders_1.136.0-1787850767_arm64.deb)
source_armv7h=(code_armhf_1787850570.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/b7f76c1a312bccf8e408c485a5c0746bb27b1205/code-insiders_1.136.0-1787850570_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('ae0c1d98b8a5ac5aa85ddfa82f3f2a3009a09c56605818184724112b786c86c5')
sha256sums_aarch64=('a9cd4e86ba1c039ebf79497ef18537a19e4f419e3ae1ca04173a1f3eed89ff54')
sha256sums_armv7h=('80d62a6578b9c3882f7c062b23a17d00b08b40021d545810f742c2d73b8a859f')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784307136
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
source_x86_64=(code_x64_1784307136.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5e212606d57c0a17f73bc8b7ae0cc9e14bcfd345/code-insiders_1.130.0-1784307136_amd64.deb)
source_aarch64=(code_arm64_1784307125.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5e212606d57c0a17f73bc8b7ae0cc9e14bcfd345/code-insiders_1.130.0-1784307125_arm64.deb)
source_armv7h=(code_armhf_1784307023.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5e212606d57c0a17f73bc8b7ae0cc9e14bcfd345/code-insiders_1.130.0-1784307023_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('fc98e87c1ba6efa1fe5dbe11d35dbb77dd35bdfad93b82edf29c1b9785b7435f')
sha256sums_aarch64=('ba40d88c054f85cc5fe394e8fc3f79216a18a3fbb764be09b9cebb797156bb3e')
sha256sums_armv7h=('074be0f50d15963ccec54a0272f10a34d87d0430c827ed0c59d1b378cedf76cb')

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

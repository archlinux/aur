# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1783531364
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
source_x86_64=(code_x64_1783531364.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/29ebca462ca8c04401d6c6f8aa50793abe8fa58d/code-insiders_1.129.0-1783531364_amd64.deb)
source_aarch64=(code_arm64_1783531359.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/29ebca462ca8c04401d6c6f8aa50793abe8fa58d/code-insiders_1.129.0-1783531359_arm64.deb)
source_armv7h=(code_armhf_1783531246.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/29ebca462ca8c04401d6c6f8aa50793abe8fa58d/code-insiders_1.129.0-1783531246_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('db18de366433a85f4cb54fb635c2329cbc4d3d17aca9c88552fb0c504dbc2e3b')
sha256sums_aarch64=('2658f5bdcade4d8d6f6e8c2551d77beab2c3e3a13aa4e171367990da89a958ca')
sha256sums_armv7h=('9d8180b2aba9f5303575591b47a834d6799d4e219c050a32fc6b4c59aa0de34e')

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

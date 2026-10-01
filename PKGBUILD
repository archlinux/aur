# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1790832227
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
source_x86_64=(code_x64_1790832227.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ec2e580674cdb512aa9b2a9596ab35d8a9590f1e/code-insiders_1.141.0-1790832227_amd64.deb)
source_aarch64=(code_arm64_1790832141.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ec2e580674cdb512aa9b2a9596ab35d8a9590f1e/code-insiders_1.141.0-1790832141_arm64.deb)
source_armv7h=(code_armhf_1790831811.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ec2e580674cdb512aa9b2a9596ab35d8a9590f1e/code-insiders_1.141.0-1790831811_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('bb310a3ba7e8b7233d9340e42dbc0c4922bf71e82001e1c3076fe87d03de1476')
sha256sums_aarch64=('468588aa89a0a0de3a250955af96469beb203d80ac077efee1ca13cea1e0d20a')
sha256sums_armv7h=('e7b7f1ab50379b8a1d09ba6b2862ead772738bedbdc4c4891acaac4df97aa05f')

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

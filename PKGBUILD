# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784783622
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
source_x86_64=(code_x64_1784783622.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9aab2f51076649ada9d3d8412558fd1484dd5f04/code-insiders_1.131.0-1784783622_amd64.deb)
source_aarch64=(code_arm64_1784783640.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9aab2f51076649ada9d3d8412558fd1484dd5f04/code-insiders_1.131.0-1784783640_arm64.deb)
source_armv7h=(code_armhf_1784783492.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/9aab2f51076649ada9d3d8412558fd1484dd5f04/code-insiders_1.131.0-1784783492_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('282f10d9e9cd1d26ea1dba6af6e65ea300d16fa81540b1063be01dbe40ff3644')
sha256sums_aarch64=('2208e260418855e827fdeb07fe34fd65a749479f0310e755b4d9a6fec66850e9')
sha256sums_armv7h=('1e2f008a2e43d8e7f8d0e7c682775969e161f67d98b2d9f4110f0d1f4f398d51')

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

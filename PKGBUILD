# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1791178836
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
source_x86_64=(code_x64_1791178836.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ae1080a9ed1098a8b532c6cfd50977d784b29e6d/code-insiders_1.141.0-1791178836_amd64.deb)
source_aarch64=(code_arm64_1791178897.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ae1080a9ed1098a8b532c6cfd50977d784b29e6d/code-insiders_1.141.0-1791178897_arm64.deb)
source_armv7h=(code_armhf_1791178519.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/ae1080a9ed1098a8b532c6cfd50977d784b29e6d/code-insiders_1.141.0-1791178519_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('e69948b19a00879eddd28f36c5e0a4023c3e240e7229380950e7d600a9b09872')
sha256sums_aarch64=('09eae02589d3e2ca5ec1243e1f50403e844cfdc20bd9de4cadd50bb108b7bede')
sha256sums_armv7h=('68bebccc5c653ef8fcd32de189b9aa66ef16d05c314e98d86bd7e38ab8c96497')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-bin
_pkgname=visual-studio-code
pkgver=1.134.0
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('code' 'vscode')
conflicts=('code')
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
source_x86_64=(code_${pkgver}_amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable)
source_aarch64=(code_${pkgver}_arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable)
source_armv7h=(code_${pkgver}_armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable)
sha256sums=('bd0d9edf69283ebdf4e73e0a7b168d2fcf50acbd01f63674cad93ed4fe42fdad')
sha256sums_x86_64=('dcd3a2f52d53df079cd389662ff1fdbeb629938331d3a63655fed929f8d49f19')
sha256sums_aarch64=('b30f5bda4855231681cc7fe22d4a59e7dbee2be170b0e4fb04c7e83b9f9affe5')
sha256sums_armv7h=('01460717d4f4c7b3109cc06b8df5ba579e98ea373751cc0ed4ae7928f26fad89')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /usr/share/code/resources/app/LICENSE.rtf \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code"

  # Fix the desktop entries
  sed -i \
    -e 's/^\(Exec=\)[^ ]*/\1code/g' \
    "${pkgdir}"/usr/share/applications/*.desktop

  # setuid on chrome-sandbox
  # Comment out if using a kernel without user namespaces, like linux-hardened
  chmod u-s "${pkgdir}/usr/share/code/chrome-sandbox"
}

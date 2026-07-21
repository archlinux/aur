# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784641894
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
source_x86_64=(code_x64_1784641894.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e5381e4f30c68abae911cad10f9d02e93c427d61/code-insiders_1.130.0-1784641894_amd64.deb)
source_aarch64=(code_arm64_1784641878.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e5381e4f30c68abae911cad10f9d02e93c427d61/code-insiders_1.130.0-1784641878_arm64.deb)
source_armv7h=(code_armhf_1784641793.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e5381e4f30c68abae911cad10f9d02e93c427d61/code-insiders_1.130.0-1784641793_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('c2c08683fa8a19634aa0b3f6655ccf710b3f40250ff006ff1103f09ce2115d0f')
sha256sums_aarch64=('57821685afb962eba2ac5cf2d1f57adf864a41dc04f0c065fc0c70c7088c82ff')
sha256sums_armv7h=('a652385e3781e60e6bf62b900f46c2f31d42ce93d6865dc1c5821161ecba55de')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1781500191
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
source_x86_64=(code_x64_1781500191.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fd0fbb3f5bf3dafc048826e300f0e6b1888af2bd/code-insiders_1.125.0-1781500191_amd64.deb)
source_aarch64=(code_arm64_1781500163.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fd0fbb3f5bf3dafc048826e300f0e6b1888af2bd/code-insiders_1.125.0-1781500163_arm64.deb)
source_armv7h=(code_armhf_1781500093.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fd0fbb3f5bf3dafc048826e300f0e6b1888af2bd/code-insiders_1.125.0-1781500093_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('0ceda0a5917a1ab3377c944f15304123cea215e927f8fcee2c890927531b6d12')
sha256sums_aarch64=('dec63233132ef99c0eb4f97e7227a2cff1f27ba43fc0bc3b60f25243d96a30ab')
sha256sums_armv7h=('473d9800a5d96ccb815197082ef4838c163d6e0c532560fbd37f60db35953789')

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

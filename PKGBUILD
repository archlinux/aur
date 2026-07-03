# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1783098672
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
source_x86_64=(code_x64_1783098672.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3fbc14e67322245a87adf07c3da0c487e7715918/code-insiders_1.128.0-1783098672_amd64.deb)
source_aarch64=(code_arm64_1783098650.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3fbc14e67322245a87adf07c3da0c487e7715918/code-insiders_1.128.0-1783098650_arm64.deb)
source_armv7h=(code_armhf_1783098548.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/3fbc14e67322245a87adf07c3da0c487e7715918/code-insiders_1.128.0-1783098548_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('2a41d939ddc386168a2f9ee4c5d34b8d928c8855a5251b018de22e3b55011a6d')
sha256sums_aarch64=('4e03df8999467bbc3a2f46adbb2c0c7316e613ca844e0aeabba486081d5518d5')
sha256sums_armv7h=('271e917b29c205296cc1115d992d9ffc93c25fa79b08e85be70ee92612bb9d14')

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

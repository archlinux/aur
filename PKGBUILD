# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1790227310
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
source_x86_64=(code_x64_1790227310.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c718b461a175300ec6f4949c808291d2149f3f8d/code-insiders_1.140.0-1790227310_amd64.deb)
source_aarch64=(code_arm64_1790227313.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c718b461a175300ec6f4949c808291d2149f3f8d/code-insiders_1.140.0-1790227313_arm64.deb)
source_armv7h=(code_armhf_1790227177.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c718b461a175300ec6f4949c808291d2149f3f8d/code-insiders_1.140.0-1790227177_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('041bdda49c2563e3d9fcc146c356eda331407a576359e6f64ff8f08402dd72d6')
sha256sums_aarch64=('de5f69f9cb0c322e514c99ac6d568bad5710cf800c17afb9fe6901dcf7ca4c2c')
sha256sums_armv7h=('97c3fa86e4120180330e9f015a3326f29f32f25fe139aeb6d1ef2e5b2ff8a1e6')

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

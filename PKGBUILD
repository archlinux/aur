# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1783714434
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
source_x86_64=(code_x64_1783714434.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e8a3eada3426fa6848c7494ebe2291702fef4a61/code-insiders_1.129.0-1783714434_amd64.deb)
source_aarch64=(code_arm64_1783714423.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e8a3eada3426fa6848c7494ebe2291702fef4a61/code-insiders_1.129.0-1783714423_arm64.deb)
source_armv7h=(code_armhf_1783714329.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e8a3eada3426fa6848c7494ebe2291702fef4a61/code-insiders_1.129.0-1783714329_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('6f3d2da113daae4f992bcb734eebea96cc2c8c616ea07ff13eadf78c3e7cdf0d')
sha256sums_aarch64=('9577b727d3bb0b77e8df4efcfb6048b4feebcd3dae66e38c9886c195b8bf0aa3')
sha256sums_armv7h=('0a69dc329e60a353ce09de783827b81e21833a2168af5ad6039edc9e74bb1da1')

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

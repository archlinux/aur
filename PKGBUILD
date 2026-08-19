# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1787160863
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
source_x86_64=(code_x64_1787160863.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fff2914fa0497b26ebcc5a3cf78fc571e24807d0/code-insiders_1.135.0-1787160863_amd64.deb)
source_aarch64=(code_arm64_1787160842.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fff2914fa0497b26ebcc5a3cf78fc571e24807d0/code-insiders_1.135.0-1787160842_arm64.deb)
source_armv7h=(code_armhf_1787160699.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/fff2914fa0497b26ebcc5a3cf78fc571e24807d0/code-insiders_1.135.0-1787160699_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('bc49356bd1d7ac552004c1e17e1abe30aac7a0fd82d8863cb381c00756ed56e5')
sha256sums_aarch64=('71ee6ed8d575e0cf0847e97182c772484bc92833a6df37ebcd0780014996c757')
sha256sums_armv7h=('a10280698fa4252a5f93c623ca6c76081fff99597ed8ce7b912aab6347f58a9c')

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

# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1789971216
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
source_x86_64=(code_x64_1789971216.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c0f6c8cd52aeceb78b91631bce1b37d161a93d3f/code-insiders_1.139.0-1789971216_amd64.deb)
source_aarch64=(code_arm64_1789967703.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c0f6c8cd52aeceb78b91631bce1b37d161a93d3f/code-insiders_1.139.0-1789967703_arm64.deb)
source_armv7h=(code_armhf_1789967495.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/c0f6c8cd52aeceb78b91631bce1b37d161a93d3f/code-insiders_1.139.0-1789967495_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('281f170821fe488e9eaa8d14ca985173e10ed64d3238891f33665e242c6c3056')
sha256sums_aarch64=('c2a2d98e7966223b9c65ccefee897982d4bf8f9cbd635f73388e6c969b61c84f')
sha256sums_armv7h=('7856a5ceb77a3706926bbe8da193d444b0c480a6cfeb4455c5fa4c39f44d0a36')

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

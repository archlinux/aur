# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1782810612
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
source_x86_64=(code_x64_1782810612.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4fe60c8b1cdac1c4c174f2fb180d0d758272d713/code-insiders_1.127.0-1782810612_amd64.deb)
source_aarch64=(code_arm64_1782810624.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4fe60c8b1cdac1c4c174f2fb180d0d758272d713/code-insiders_1.127.0-1782810624_arm64.deb)
source_armv7h=(code_armhf_1782810475.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4fe60c8b1cdac1c4c174f2fb180d0d758272d713/code-insiders_1.127.0-1782810475_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('b7e2f5a23a6a6a4e59769cb186434c9ccd6beed49b3804c7a5555db0c9fe06eb')
sha256sums_aarch64=('02c1249db33c57496f50ceba8e93a259cc97332e720d7124485f0428234f44a7')
sha256sums_armv7h=('5adfc7fb89b2d8d0a1bd837fec5e93b88213c91414d4a177bd79c35deaba84ba')

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

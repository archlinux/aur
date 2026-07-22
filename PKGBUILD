# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1784697320
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
source_x86_64=(code_x64_1784697320.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e57c7d32e8afb24f290470a45fb56b5d7560c2d3/code-insiders_1.131.0-1784697320_amd64.deb)
source_aarch64=(code_arm64_1784697295.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e57c7d32e8afb24f290470a45fb56b5d7560c2d3/code-insiders_1.131.0-1784697295_arm64.deb)
source_armv7h=(code_armhf_1784697127.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e57c7d32e8afb24f290470a45fb56b5d7560c2d3/code-insiders_1.131.0-1784697127_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('b1ebd917450a08623dbbee605a788d12de6d3a09cbd95e886467ad37d21abe37')
sha256sums_aarch64=('abeb4730da977d258f53438fe779968ef6df8094d68303af23a35b9df615a89e')
sha256sums_armv7h=('2e3e39e9e238d6b1845d37b7383b0064f099fe16bb3147e73b256673073421d7')

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

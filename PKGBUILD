# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1789579030
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
source_x86_64=(code_x64_1789579030.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4dbe1643e6189ba7b1bbe542cc0e56a94d9ff132/code-insiders_1.139.0-1789579030_amd64.deb)
source_aarch64=(code_arm64_1789578973.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4dbe1643e6189ba7b1bbe542cc0e56a94d9ff132/code-insiders_1.139.0-1789578973_arm64.deb)
source_armv7h=(code_armhf_1789578827.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/4dbe1643e6189ba7b1bbe542cc0e56a94d9ff132/code-insiders_1.139.0-1789578827_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('4bf0958a1e902e963e45d9874800484d822b56b6250426da1aedfad1bb289510')
sha256sums_aarch64=('2c4f1bf571ffd2154e914cc77096348f2cc07936cd50c543c8d1453b0c5d41fb')
sha256sums_armv7h=('2c0af73ce93d8a60000585d3f488fa6ae320099c66432de2152d0d413c9b0db0')

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

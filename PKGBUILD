# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1787057822
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
source_x86_64=(code_x64_1787057822.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/0d0c8a6169358a4f493c1dd33cb700268de5dc9a/code-insiders_1.134.0-1787057822_amd64.deb)
source_aarch64=(code_arm64_1787057795.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/0d0c8a6169358a4f493c1dd33cb700268de5dc9a/code-insiders_1.134.0-1787057795_arm64.deb)
source_armv7h=(code_armhf_1787057636.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/0d0c8a6169358a4f493c1dd33cb700268de5dc9a/code-insiders_1.134.0-1787057636_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('8fee8f2c01598e143152ae2fca874db298169cb2c7d0ed77218664938ba02fdf')
sha256sums_aarch64=('4f3b53624eefa71ff8e860ae92422644f297ca8c0323a306c1513092fe224668')
sha256sums_armv7h=('f1470a0fd34c704f98309c3fe08e73591fd6a4a6f4b69a09ebab30358b7f8b1e')

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

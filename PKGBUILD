# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1792796538
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
            'icu69: Needed for live share'
            # See https://code.visualstudio.com/docs/agents/run/agent-sandboxing#_check-platform-availability
            'bubblewrap: Agent host sandboxing' 'socat: Agent host sandboxing'
            )
source=(${_pkgname}-bin.sh)
source_x86_64=(code_x64_1792796538.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/7cc5e7382b284f2156375fcedc388b44a07c0487/code-insiders_1.144.0-1792796538_amd64.deb)
source_aarch64=(code_arm64_1792796469.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/7cc5e7382b284f2156375fcedc388b44a07c0487/code-insiders_1.144.0-1792796469_arm64.deb)
source_armv7h=(code_armhf_1792796224.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/7cc5e7382b284f2156375fcedc388b44a07c0487/code-insiders_1.144.0-1792796224_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('7fb414cc8387fefd583a71641157ed85733acb87f29d8906396e99481bacecf2')
sha256sums_aarch64=('08eba426a7bc3e5132aa4c5029ac5d809e120bfcb8e3f305833bf8ce3cba1ca0')
sha256sums_armv7h=('a56bd9efcd8fb5c574ff811bdfdabbb247a49ae14c48c6bb4a81f2d4203f394f')

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

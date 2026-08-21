# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1787303937
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
source_x86_64=(code_x64_1787303937.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/8a537d3a1d9377d08cc2d1745830103b18d84e79/code-insiders_1.135.0-1787303937_amd64.deb)
source_aarch64=(code_arm64_1787303924.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/8a537d3a1d9377d08cc2d1745830103b18d84e79/code-insiders_1.135.0-1787303924_arm64.deb)
source_armv7h=(code_armhf_1787303781.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/8a537d3a1d9377d08cc2d1745830103b18d84e79/code-insiders_1.135.0-1787303781_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('c418b5dc701a275ca5f06bbddc496d42c9c4f0acea94e29b54109e2b55160a0f')
sha256sums_aarch64=('a9e761565aefc59005121a01fc198eb40e364d6a2d33ffa2918a22af6f7c45de')
sha256sums_armv7h=('f45f6139e57ec6d1913751a924c5b2eb5c2f2bf2f0b5ee970c1ea903195127c9')

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

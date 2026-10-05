# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1791222179
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
source_x86_64=(code_x64_1791222179.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e26528f6873ce188d71933ff159c633ac1a5cc8c/code-insiders_1.141.0-1791222179_amd64.deb)
source_aarch64=(code_arm64_1791222091.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e26528f6873ce188d71933ff159c633ac1a5cc8c/code-insiders_1.141.0-1791222091_arm64.deb)
source_armv7h=(code_armhf_1791221791.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/e26528f6873ce188d71933ff159c633ac1a5cc8c/code-insiders_1.141.0-1791221791_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('4bc26762b7eae01fecb399530bb6e7669c34cb18f05d45e752025ea9d55473be')
sha256sums_aarch64=('e49138773b0a3b386281fb5a7dcd3c579f4f383aeb5a7df97d5c5538a7b93202')
sha256sums_armv7h=('7679af1e72bd55c48e0f239e164efa275d622fee7250de658cf5cfdabd9ae090')

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

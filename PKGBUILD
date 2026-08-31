# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1788165398
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
source_x86_64=(code_x64_1788165398.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5c9173276314a5688bc10275e5a25c8d0fe9f4f7/code-insiders_1.136.0-1788165398_amd64.deb)
source_aarch64=(code_arm64_1788165371.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5c9173276314a5688bc10275e5a25c8d0fe9f4f7/code-insiders_1.136.0-1788165371_arm64.deb)
source_armv7h=(code_armhf_1788165238.deb::https://vscode.download.prss.microsoft.com/dbazure/download/insider/5c9173276314a5688bc10275e5a25c8d0fe9f4f7/code-insiders_1.136.0-1788165238_armhf.deb)
sha256sums=('bf8abef6671392bf1f11d203fd940cc44e764e9c6352be7799880535c2f15087')
sha256sums_x86_64=('78b391b2b0be14f7716dbf9acaed38613a9f4a5633667a95a9e3742b728007a4')
sha256sums_aarch64=('90f31df467dbdf42d3d3fe67a6fd43536e07742ab9799b084c274633613348d1')
sha256sums_armv7h=('f865e95e0fec80c41635ff899effaf994a4ee62a5ace05c0a8ee4beb40d97bda')

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

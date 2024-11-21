# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-bin
_pkgname=windsurf
pkgver=1.0.3
pkgrel=2
pkgdesc="Tomorrow's Editor, Today. Built to keep you in flow state with instant, invaluable AI developer assistance."
arch=('x86_64')
url="https://codeium.com/windsurf"
download_url="https://windsurf-stable.codeiumdata.com/linux-x64/stable/8700dafefa2ae56df8cf3f66b96d4d03815405fa"
license=('custom')
provides=('windsurf')
conflicts=('windsurf')
options=("!strip" "!debug")
install=$pkgname.install
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vswindsurf/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss glibc libxkbfile gnupg libsecret lsof shared-mime-info xdg-utils)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync'
             # See https://github.com/MicrosoftDocs/live-share/issues/4650
            'icu69: Needed for live share' )

source=(windsurf.desktop windsurf-url-handler.desktop windsurf-workspace.xml ${_pkgname}-bin.sh)

source_x86_64=(windsurf_x64_${pkgver}.tar.gz::$download_url/Windsurf-linux-x64-${pkgver}.tar.gz)

sha256sums=('aabcf260e913a2faa9195f0eb72b62be94f276d5e90672d2f7c8435eb41bff66'
            'a3d367dc1b7938172141a94c3107e9ff23cf0d628a2999cda466f41b6e9ac259'
            '1458655cc211cef5b243baeecc082e597af2a61291571c74b3c639f6d2e7dd97'
            'bed47ba135c4b45ef1cba3aeac28260d508162d6e85922b120dfd82794cf1b1b')
sha256sums_x86_64=("a5f96522c338a6253c974b136514c267486e2e42b096769203c14c78c8982538")

package() {
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/Windsurf/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -m644 "${srcdir}/Windsurf/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -m644 "${srcdir}/windsurf.desktop" "${pkgdir}/usr/share/applications/windsurf.desktop"
  install -m644 "${srcdir}/windsurf-url-handler.desktop" "${pkgdir}/usr/share/applications/windsurf-url-handler.desktop"
  install -m644 "${srcdir}/windsurf-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
  install -Dm 644 "${srcdir}/Windsurf/resources/completions/bash/windsurf" "${pkgdir}/usr/share/bash-completion/completions/windsurf"
  install -Dm 644 "${srcdir}/Windsurf/resources/completions/zsh/_windsurf" "${pkgdir}/usr/share/zsh/site-functions/_windsurf"

  cp -r "${srcdir}/Windsurf/"* "${pkgdir}/opt/${_pkgname}"

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/windsurf"

  # Clean Symlinks
  find "${pkgdir}/opt/${_pkgname}/" -type l -delete
}


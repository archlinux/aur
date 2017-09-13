# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders
pkgver=1.17.0.1505281268
pkgrel=1
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64' 'i686')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('vscode','visualstudiocode')
depends=(fontconfig libxtst gtk2 python cairo alsa-lib gconf nss gcc-libs libnotify libxss gvfs)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/latest/linux-x64/insider
               ${pkgname}.desktop
               )
source_i686=(code_ia32_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/latest/linux-ia32/insider
              ${pkgname}.desktop
              )
sha256sums_x86_64=('aef7deae226aca14a4d93956ff6a502b5daf56939673fb2de21f9a312da94d67'
                   'aadadd67b4a8481a078b311b194b6d2a1067a5ee28e485b0e6aefc5d0bd258ce')
sha256sums_i686=('d019fdc78d7277008d718371853f3d316c1352d6f5e9f3ee474d2c3da17f1710'
                 'aadadd67b4a8481a078b311b194b6d2a1067a5ee28e485b0e6aefc5d0bd258ce')
pkgver() {
    if [ "${CARCH}" = "x86_64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://vscode-update.azurewebsites.net/latest/linux-x64/insider); echo "${ADDR[5]}" | sed 's/code-insider-//g' | sed 's/_amd64.tar.gz//g' | sed 's/-/./g'
    else
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://vscode-update.azurewebsites.net/latest/linux-ia32/insider); echo "${ADDR[5]}" | sed 's/code-insider-//g' | sed 's/_i386.tar.gz//g' | sed 's/-/./g'
    fi
}
package() {
  _pkg=VSCode-linux-x64
  if [ "${CARCH}" = "i686" ]; then
    _pkg=VSCode-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}" -R
  ln -s /opt/${pkgname}/bin/code-insiders "${pkgdir}"/usr/bin/code-insiders
}

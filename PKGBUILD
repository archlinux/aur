pkgname=code-insiders
_code=visual-studio-code-insiders
pkgver=1589357893
pkgrel=1
pkgdesc="Editor to realize modern  websites or applications."
arch=('x86_64' 'i686')
url="https://code.visualstudio.com/"
conflicts=('visual-studio-code-insiders')
provide=('code-insiders')
license=('custom: commercial')
# lsof: need for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
depends=(libxkbfile gnupg gtk3  lsof  glib2 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('libdbusmenu-glib: Needed for KDE global menu')
source_x86_64=(code_x64_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/latest/linux-x64/insider
              ${_code}.desktop ${_code}-url-handler.desktop
               )
source_i686=(code_ia32_${pkgver}.tar.gz::https://vscode-update.azurewebsites.net/latest/linux-ia32/insider
              ${_code}.desktop ${_code}-url-handler.desktop
              )
sha256sums_x86_64=('SKIP'
                   'edfeb13aa50d35fbae748ff545b5bd126be916dbfeda682157e3d5ce81574db2'
                   'd06d9d057b507d1747a8ed8ae304beb5e20c7bf887c362c941d85b02c893069e')
sha256sums_i686=('SKIP'
                 'edfeb13aa50d35fbae748ff545b5bd126be916dbfeda682157e3d5ce81574db2'
                 'd06d9d057b507d1747a8ed8ae304beb5e20c7bf887c362c941d85b02c893069e')
pkgver() {
    if [ "${CARCH}" = "x86_64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://vscode-update.azurewebsites.net/latest/linux-x64/insider); echo "${ADDR[5]}" | sed 's/code-insider-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    else
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://vscode-update.azurewebsites.net/latest/linux-ia32/insider); echo "${ADDR[5]}" | sed 's/code-insider-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    fi
}
package() {
  _pkg=VSCode-linux-x64
  if [ "${CARCH}" = "i686" ]; then
    _pkg=VSCode-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/licenses/${_code}"
  install -d "${pkgdir}/opt/${_code}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_code}/LICENSE.rtf"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_code}.png"
  install -m644 "${srcdir}/${_code}.desktop" "${pkgdir}/usr/share/applications/${_code}.desktop"
  install -m644 "${srcdir}/${_code}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_code}-url-handler.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_code}" -R
  ln -s /opt/${_code}/bin/${pkgname} "${pkgdir}"/usr/bin/{pkgname}
}

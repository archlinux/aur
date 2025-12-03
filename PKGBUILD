# Maintainer: Serge K <arch@phnx47.net>

pkgname=fastmail
pkgver=1.0.6
pkgrel=1
pkgdesc='Email made better'
license=('custom:fastmail')
url='https://www.fastmail.com'
arch=('x86_64')
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('desktop-file-utils')
_appimg="Fastmail-${pkgver}.AppImage"
source=("${_appimg}::https://dl.fastmailcdn.com/desktop/production/linux/x64/${_appimg}"
        "LICENSE.md") # https://www.fastmail.com/policies/terms-of-service/
sha512sums=('58a321cbb74ba0552a5247af919020c60c69cf98c3e0ef5555a28363142cd235c956de4651c2070c9e9a648246ea3ca29c00b5f0dcc5def26739fb70f1959d9a'
            'c544bd5496ec83a0b2475eb12070951ac92da66a6314357165ba517f986412f2c54b303186efc2c068562ac345108eeef56e7926a920cbbd820e700607d8b220')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  desktop-file-edit \
    --set-key=Exec \
    --set-value="${pkgname} %U" \
    --set-icon="${pkgname}" \
    --add-category=Network \
    --remove-key=X-AppImage-Version \
    production.desktop

  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "squashfs-root/." "${pkgdir}/opt/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/production" "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${pkgname}/production.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${pkgname}/usr/share/icons/hicolor/${i}x${i}/apps/production.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=fastmail
pkgver=1.7.0
pkgrel=1
pkgdesc='Email made better'
license=('custom:fastmail')
url='https://www.fastmail.com'
arch=('x86_64')
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('desktop-file-utils')
_appimg="com.fastmail.Fastmail-${pkgver}.AppImage"
source=("${_appimg}::https://dl.fastmailcdn.com/desktop/production/linux/x64/${_appimg}"
        "LICENSE.md") # https://www.fastmail.com/policies/terms-of-service/
sha512sums=('77644da6ad2274d715457890b386d239d2ebcbdbcf54e2809ce57179910163cba5b03ce24f50c4393433d05980f091a5ecc130b39adbdb4141317606270fa1b3'
            'e336da034d45735cf62687e8b917e9d995a446685b1341d823ea032f9256751a92ecf5501c48ed4daf18a76df30a3a89b4a6f07aa4f6b2c2d34224c352435d89')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  desktop-file-edit \
    --set-key=Exec \
    --set-value="${pkgname} %U" \
    --set-key=Name \
    --set-value="Fastmail" \
    --remove-key=X-AppImage-Version \
    ${pkgname}.desktop

  rm "AppRun" "resources/app-update.yml"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "squashfs-root/." "${pkgdir}/opt/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
    ln -s "/opt/${pkgname}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

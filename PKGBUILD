# Maintainer: Serge K <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=fastmail
pkgver=1.5.1
pkgrel=2
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
sha512sums=('f142d795209e4ff3253b4aa6730287826692899bf3edd01618b896aa83a8ad2916b0d67ef5d46ed8f85998191d53793447671626c03ac40e1456266d39270fd1'
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

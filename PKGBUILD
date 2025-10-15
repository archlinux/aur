# Maintainer: Serge K <arch@phnx47.net>

pkgname=fastmail
pkgver=1.0.1
pkgrel=1
pkgdesc='Email and calendar made better'
license=('Commercial')
url='https://www.fastmail.com'
arch=('x86_64')
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib')
_appimg="Fastmail-${pkgver}.AppImage"
source=("${_appimg}::https://dl.fastmailcdn.com/desktop/production/linux/x64/${_appimg}")
sha512sums=('862a32dc1a5667cfb441fd5caf63deb3be8fb535de44e1e3afde40a8faa5a9ee8c251e09dadabd74a17ce1c87d37923ecd0f31661bed0cc2b33f638443213e50')

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  cd squashfs-root
  sed -e "s/AppRun --no-sandbox/${pkgname}/g" -i production.desktop
  sed -e "s/production/${pkgname}/g" -i production.desktop
  sed -e "/X-AppImage-Version/d" -i production.desktop

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
}

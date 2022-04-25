# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname=altair
pkgver=4.4.1
pkgrel=1
pkgdesc='A beautiful feature-rich GraphQL Client for all platforms.'
arch=('x86_64')
depends=('gtk2' 'gtk3' 'nss' 'libxss' 'dbus-glib' 'electron14')
url="https://github.com/imolorhe/altair"
license=('MIT')
provides=('altair')

source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/imolorhe/altair/releases/download/v${pkgver}/altair_${pkgver}_${arch}_linux.AppImage"
               altair)
sha256sums_x86_64=('6cc13b16fc81b3b7f8f53dde6b367899c1ff86afbfbec361a867b90472eea7ca'
                   'b2a068cbaca2bc6f20cd84bc2e8d5b5edcddb8ef2e280402b3c008be984d7070')

prepare() {
  # mark as executable so we can extract
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"

  # extract the AppImage
  "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract

  # remove execution bit after extraction
  chmod -x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
  # install the electron wrapper
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # install asar file
  install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"

  # desktop entry
  sed -i.bak s/Exec=AppRun/Exec=altair/g "${srcdir}/squashfs-root/${pkgname}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # install the icons
  for i in 16 32 48 60 120 192 310; do
    install -Dm 644 \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}

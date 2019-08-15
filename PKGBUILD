# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname=altair
pkgver=2.3.0
pkgrel=1
pkgdesc='A beautiful feature-rich GraphQL Client for all platforms.'
arch=('x86_64')
depends=('gtk2' 'gtk3' 'nss' 'libxss' 'dbus-glib' 'electron4')
url="https://github.com/imolorhe/altair"
license=('MIT')
provides=('altair')

source_x86_64=("${pkgname}.AppImage::https://github.com/imolorhe/altair/releases/download/v${pkgver}/Altair-GraphQL-Client-${pkgver}.AppImage"
               altair)
sha256sums_x86_64=('4b11746dfe789ba1a1cdf84a085207cb1588258a79b00a6d546670dd76a5a44f'
                   '7ac2746cb9c44d54e234b7e4a222e0ee97ece2aa61679a03082d4f2d7dfcaf9e')

prepare() {
  # mark as executable so we can extract
  chmod +x "${srcdir}/${pkgname}.AppImage"

  # extract the AppImage
  "${srcdir}/${pkgname}.AppImage" --appimage-extract

  # remove execution bit after extraction
  chmod -x "${srcdir}/${pkgname}.AppImage"
}

package() {
  # install the electron4 wrapper
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

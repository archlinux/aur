# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipto-bin
pkgver=7.2.17
pkgrel=12
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('unknown')
depends=('alsa-lib' 'gtk3' 'nss')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}.pro")
replaces=("${pkgname%-bin}.pro")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage")
sha256sums=('ed0fc3b0e84efc986fdb41a1a38a1483c61d3c128eaa5014e97dc14c3b376028')

prepare() {
  chmod +x "${pkgname%-bin}-$pkgver.AppImage"
  ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

  # Correct path for .desktop file
  sed -i 's|Exec=AppRun|Exec=clipto|g' "squashfs-root/${pkgname%-bin}.desktop"

  # Remove X-AppImage-Version
  sed -i '/AppImage/d' "squashfs-root/${pkgname%-bin}.desktop"

  # Remove invalid symlink
  rm squashfs-root/clipto.png
}

package() {
  cd "$srcdir/squashfs-root"
  find {locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

  install -d "$pkgdir/opt/${pkgname%-bin}"
  cp -r * "$pkgdir/opt/${pkgname%-bin}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" -t "$pkgdir/usr/bin/"

  install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons"
  cp -r usr/share/icons/hicolor "$pkgdir/usr/share/icons/"

  rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
}

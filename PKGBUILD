# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto-bin
pkgver=7.2.17
pkgrel=2
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=('electron15')
optdepends=('libnotify: for desktop notifications'
            'libappindicator-gtk3: for tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}.pro")
replaces=("${pkgname%-bin}.pro")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('ed0fc3b0e84efc986fdb41a1a38a1483c61d3c128eaa5014e97dc14c3b376028'
            '53a200544b66a91f2d3129682c2f78f1a146b5256617c1f25c485ff74e7d42c6')

prepare() {
  chmod +x "${pkgname%-bin}-$pkgver.AppImage"
  ./"${pkgname%-bin}-$pkgver.AppImage" --appimage-extract

  sed -i 's|Exec=AppRun|Exec=clipto|g' "squashfs-root/${pkgname%-bin}.desktop"
}

package() {
  cd "$srcdir/squashfs-root"
  find {locales,resources,usr/share/icons}/ -type d -exec chmod 755 {} +

  install -d "$pkgdir/usr/lib/${pkgname%-bin}"
  cp -r resources "$pkgdir/usr/lib/${pkgname%-bin}"

  install -Dm755 "$srcdir/${pkgname%-bin}" -t "$pkgdir/usr/bin"

  install -Dm644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"

  install -d "$pkgdir/usr/share/icons"
  cp -r usr/share/icons/hicolor "$pkgdir/usr/share/icons"
}

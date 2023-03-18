# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clipto-bin
pkgver=7.2.17
pkgrel=11
_electronversion=21
pkgdesc="Effortless, super fast and flexible notes taking app and clipboard manager."
arch=('x86_64')
url="https://clipto.pro"
license=('custom')
depends=("electron${_electronversion}")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}.pro")
replaces=("${pkgname%-bin}.pro")
source=("https://github.com/clipto-pro/Desktop/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.AppImage"
        "${pkgname%-bin}")
sha256sums=('ed0fc3b0e84efc986fdb41a1a38a1483c61d3c128eaa5014e97dc14c3b376028'
            '7c299ef6dfa822911c2facd564b1459a7564be07a6e89875f0fca1d357374ec4')

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

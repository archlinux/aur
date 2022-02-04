# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.0.5
pkgrel=1
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
depends=('fuse2')
_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"
source=("${_filename}::https://desktop.clickup.com/linux")
options=('!strip')

prepare() {
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=/opt/${pkgname}/$_filename %U|" squashfs-root/ClickUp.desktop
}

package() {
  install -Dm755 $_filename "$pkgdir/opt/${pkgname}/$_filename"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/$_filename" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 squashfs-root/ClickUp.desktop "$pkgdir/usr/share/applications/clickup.desktop"
  install -Dm644 squashfs-root/ClickUp.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/clickup.png"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}

sha512sums=('f61d36cc58497c57518329aed316c9c79bb1c46834cbda30ba897e0a54ea2a1e2faf6053a0a5cdf2f89ee94f8f8918c85bd91c3dc64c8adbe2180a640914c5c2')

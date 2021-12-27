# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.0.4
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

sha512sums=('ed2f537e3f5c1f645b30626922a9a5b6e1253f40192fbfae2ae1f8221a22f597fb3990132e7d04f7a9e70b007d65999eb3c398bd18b3b875466cf1f7bfae9502')

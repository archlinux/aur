# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=2.0.21
pkgrel=3
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
depends=('fuse2')
_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"
source=("https://github.com/clickup/clickup-release/releases/download/v${pkgver}/${_filename}")
options=('!strip')

prepare() {
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=/opt/$_filename %U|" squashfs-root/clickup-desktop.desktop
}

package() {
  install -Dm755 $_filename "$pkgdir/opt/$_filename"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "$pkgdir/opt/${pkgname}/$_filename" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 squashfs-root/clickup-desktop.desktop "$pkgdir/usr/share/applications/clickup.desktop"
  install -Dm644 squashfs-root/clickup-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/clickup-desktop.png"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}

sha512sums=('abe7664deaac7495028eb45863568b29a0ac5c76ad81c0b5e42ea7c2982beb8a60f2c273d56f9655942f347af280201087cf2f2ebb451c1ed3f6126dff5e8dbf')

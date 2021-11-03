# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.0.3
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

sha512sums=('74d42fd492f3f847f2cc12d6191788295f7f8daf4416196df10e820f99166614f97f7ca60a23eebdbbd6b2e8e637ee78b506600147593d895191af4c2959235d')

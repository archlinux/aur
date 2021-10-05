# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=3.0.2
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

sha512sums=('00458380c6a298185b40289785a02c608680ad49b43b2c96922be9f2c6e66fed2dd40999599b70289b0f23b6f17d019114a994a21973ef016dcbba3073a8b826')

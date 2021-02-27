# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=2.0.22
pkgrel=1
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

sha512sums=('8db74807c30816e2ebcba5431272f6d85dcca099ce7a536ac6ea139a7aeb85686e5e1037828e104eaadd654eb74bf67d6537b1c80037864e772441b9badae4a0')

#    Maintainer: J. Emiliano Deustua <edeustua@gmail.com>

pkgname=twist
pkgver=1.0.8
pkgrel=2
pkgdesc="Twist is an async messaging app that makes collaboration easy from anywhere by using threads to organize your conversations."
url="https://twist.com/"
arch=("x86_64")
license=("Private")
source=(
  "https://downloads.twist.com/linux/Twist-${pkgver}.AppImage"
)
sha256sums=(
  "03e9dd1bada5108b2c7ad17e53566c68b0ffd2328d08b5d34d0cc72c5795b3e9"
)
options=(
  "!strip"
  "libtool"
  "staticlibs"
)

prepare() {
  echo "Building twist.desktop"
  chmod +x Twist-${pkgver}.AppImage
  ./Twist-${pkgver}.AppImage --appimage-extract
  cd squashfs-root

  sed -i 's/AppRun/env APPDIR=\/opt\/twist \/opt\/twist\/AppRun/g' twist.desktop
}
            
package() {
  mkdir -p ${pkgdir}/opt
  cp -r squashfs-root ${pkgdir}/opt/twist
  chmod -R u=rwX,go=rX ${pkgdir}/opt/twist
  install -D -m 644 squashfs-root/twist.desktop ${pkgdir}/usr/share/applications/twist.desktop
  install -D -m 644 squashfs-root/twist.png ${pkgdir}/usr/share/icons/twist.png
}

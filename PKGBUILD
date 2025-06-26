# Maintainer: VCalV
# Contributor: meanlint <meanlint@outlook.com>
# Contributor: username227 <gfrank227 at gmail dot com>
# Based on "citra-appimage" pkg made by AlphaJack as a base

pkgname="borked3ds-appimage"
pkgver=2025.03.11
pkgrel=4
pkgdesc='An experimental Nintendo 3DS Emulator based off of Citra.'
url='https://github.com/Borked3DS/Borked3DS'
license=("GPL-2.0-only")
arch=("x86_64")
provides=("borked3ds")
conflicts=('borked3ds')
replaces=()
depends=(hicolor-icon-theme)
optdepends=(python)
source=("https://github.com/Borked3DS/Borked3DS/releases/download/v$pkgver/borked3ds-v$pkgver-linux-appimage-gcc-24.04.tar.xz")
b2sums=('ded3d6dfd734d2a619583325ed1a478d18b2df891d6b0d39b29b05e0c9da6bf2113cac5c29ec681208f02644f9d11e79cb9a900e067058c51e0489f5ae740a06')
options=("!strip")

prepare(){
 cd "borked3ds-v$pkgver-linux-appimage-gcc-24.04"

 for cmd in borked3ds borked3ds-room borked3ds-cli; do
  ./$cmd.AppImage --appimage-extract 'usr/share/icons/hicolor/scalable/*'
  ./$cmd.AppImage --appimage-extract 'usr/share/applications/*'
 done
 chmod -R a-x+rX squashfs-root/usr
}

package(){
 cd "borked3ds-v$pkgver-linux-appimage-gcc-24.04"
 install -dm755 "${pkgdir}/usr/bin"

 for cmd in borked3ds borked3ds-room borked3ds-cli; do
  install -D -m 755 -t "${pkgdir}/opt/${pkgname}/" "${cmd}.AppImage"
  ln -s "/opt/${pkgname}/${cmd}.AppImage" "${pkgdir}/usr/bin/${cmd}"
  
 done;

 install -D -m 755 "scripting/borked3ds.py"    -t "$pkgdir/opt/${pkgname}/"
 install -D -m 755 "license.txt"    -t "$pkgdir/usr/share/licenses/$pkgname"
 install -D -m 755 -t "$pkgdir/usr/share/docs/$pkgname" *.md
 install -D -m 644 "dist/borked3ds.png"        -t "$pkgdir/usr/share/pixmaps"

 cp -a squashfs-root/* "$pkgdir/"
}

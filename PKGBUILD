# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=electronic-wechat-uos-electron
_pkgname=electronic-wechat
pkgver=2.3.2
pkgrel=6
pkgdesc=" An Electron application for WeChat"
arch=("x86_64")
url="https://github.com/Riceneeder/electronic-wechat"
license=('MIT')
depends=('electron')
provides=('electronic-wechat' 'electronic-wechat-uos-bin')
conflicts=('electronic-wechat' 'electronic-wechat-uos-bin')
source=(
  https://github.com/Riceneeder/${_pkgname}/releases/download/v${pkgver}-${pkgrel}/${_pkgname}_${pkgver}_amd64.deb)
sha256sums=('24d2b3a8ff1609b2f3c0fa894fcea15831fa5a2bf5c89f1d022352c7d1089e4f')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  mkdir -p "${srcdir}/dpkgdir/temp"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  mv ${srcdir}/dpkgdir/usr/lib/electronic-wechat/resources/app.asar ${srcdir}/dpkgdir/temp
  mv ${srcdir}/dpkgdir/usr/lib/electronic-wechat/assets/icon.png ${srcdir}/dpkgdir/temp
  rm -rf ${srcdir}/dpkgdir/usr/
  mkdir -p "${srcdir}/dpkgdir/usr/lib/electronic-wechat"
  mkdir -p "${srcdir}/dpkgdir/usr/share/icons/hicolor/512x512/apps"
  mkdir -p "${srcdir}/dpkgdir/usr/bin"
  mkdir -p  "${srcdir}/dpkgdir/usr/share/applications"
  mv ${srcdir}/dpkgdir/temp/app.asar ${srcdir}/dpkgdir/usr/lib/electronic-wechat/
  mv ${srcdir}/dpkgdir/temp/icon.png ${srcdir}/dpkgdir/usr/share/icons/hicolor/512x512/apps/electronic-wechat.png
  echo -e '#!/bin/bash \nelectron13 /usr/lib/electronic-wechat/app.asar' > ${srcdir}/dpkgdir/usr/lib/electronic-wechat/wechat
  echo "electron /usr/lib/electronic-wechat/app.asar" > ${srcdir}/dpkgdir/usr/bin/wechat
  echo -e "[Desktop Entry]
Name=Electronic Wechat
Comment=Unofficial WeChat client built with React, MobX and Electron.
Exec=electronic-wechat %U 
Terminal=false
Type=Application
Icon=electronic-wechat.png                                        
Categories=Network;Utility;Chat;" > ${srcdir}/dpkgdir/usr/share/applications/electronic-wechat.desktop
 rm -rf "${srcdir}/dpkgdir/temp"
 chmod 755 ${srcdir}/dpkgdir/usr/bin/wechat
}
  
package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 

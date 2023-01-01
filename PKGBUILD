# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: hexchain <i at hexchain.org>
# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=electronic-wechat
pkgver=2.3.2
pkgrel=1
pkgdesc="  Better WeChat client under Linux. Which used system Electron and removed the useless content in the package"
arch=("x86_64")
url="https://github.com/zzy-ac/electronic-wechat"
license=('MIT')
depends=('electron')
provides=('electronic-wechat-uos-electron' 'electronic-wechat-uos-bin')
conflicts=('electronic-wechat-uos-electron' 'electronic-wechat-uos-bin')
source=(
  https://github.com/zzy-ac/${pkgname}/releases/download/v${pkgver}-${pkgrel}/${pkgname}_${pkgver}_amd64.deb)
sha256sums=('2b080c5296a39c0d4c6dcc8bdc30b9aacaefd372d98433481f59e1be3602c4c5')

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
  echo "#!/bin/bash \nexec electron /usr/lib/electronic-wechat/app.asar" > ${srcdir}/dpkgdir/usr/bin/wechat
  echo -e "[Desktop Entry]
Name=Electronic Wechat
Comment=Unofficial WeChat client built with React, MobX and Electron.
Exec=wechat %U 
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

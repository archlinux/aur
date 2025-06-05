# Maintainer: AspirinZ <aspirin000@sjtu.edu.cn>
pkgname=SJTU-Canvas-Helper
pkgver=1.3.30
pkgrel=1
pkgdesc="Helping you use the SJTU course platform more quickly and easily"
arch=('x86_64')
url="https://github.com/Okabe-Rintarou-0/SJTU-Canvas-Helper"
depends=('fuse2' 'gtk3' 'libnotify')
license=('MIT')
source=("${pkgname}_${pkgver}_amd64.AppImage::https://github.com/Okabe-Rintarou-0/SJTU-Canvas-Helper/releases/download/app-v${pkgver}/${pkgname}_${pkgver}_amd64.AppImage"
  "${pkgname}.desktop"
  "LICENSE::https://raw.githubusercontent.com/Okabe-Rintarou-0/SJTU-Canvas-Helper/main/LICENSE")
sha256sums=('8e18d29510c575513d574f13b642b61871a151363aff3b4ebe3690e8033f2ebf'
'acab9da96b740c32f9d03265e00dd541c0643c6513869eb134d9e472bd9b7e73'
'd78852e5fb84b91fa0dddd826ff37103d40f680a2a00d6725d7d3fbe0b68288c')
prepare() {
  chmod +x "${pkgname}_${pkgver}_amd64.AppImage"
  ./${pkgname}_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -r squashfs-root/* "$pkgdir/opt/$pkgname"
  
  # 安装许可证
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
export APPDIR="/opt/$pkgname"
exec "\$APPDIR/AppRun" "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # 安装桌面文件
  install -Dm644 "$srcdir/${pkgname}.desktop" -t "$pkgdir/usr/share/applications"

  # 安装图标
  install -Dm644 "squashfs-root/sjtu-canvas-helper.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  sed -i "s|Icon=.*|Icon=$pkgname|" "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

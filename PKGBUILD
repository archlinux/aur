# Maintainer: llyy@sipeed.com
pkgname=maixvision-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="MaixVision development environment for Sipeed Maix series AIoT boards"
arch=('x86_64')
url="https://www.sipeed.com/maixvision"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libsecret')
source=("https://cdn.sipeed.com/maixvision/${pkgver}/maixvision_${pkgver}_amd64.deb"
        "maixvision.desktop"
        "maixvision.png")
sha256sums=('a807e1d946862bb3972562ed25ba46dd236b7f04dd78e23bf419f3425626465d'
            '2b36fd1a1c3640900ad6fd47e6125c800fce8f00652be773dcd53f7c530535ce'
            'c2f483122d4c799b877e1e24426e592fdd90b5c545fe1be4e43aac32120568b7')

prepare() {
  bsdtar -xvf data.tar.xz -C "$srcdir"
}

package() {
  # 复制所有文件到系统
  cp -r "$srcdir/opt" "$pkgdir/"

  # 创建符号链接到/usr/bin以便从终端启动
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/MaixVersion/maixversion" "$pkgdir/usr/bin/maixvision"

  # 安装桌面文件
  install -Dm644 "$srcdir/maixvision.desktop" "$pkgdir/usr/share/applications/maixvision.desktop"

  # 安装图标
  install -Dm644 "$srcdir/maixvision.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/maixvision.png"

  # 修复权限
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/MaixVision/maixvision"
}

# Maintainer: Your Name <your@mail.com>
pkgname=evplayer2-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="一唯EV加密播放器，Wine封装版"
arch=('x86_64')
url="https://www.ieway.cn/evplayer2.html"
license=('custom')
depends=('wine-staging' 'winetricks' 'xdg-utils')
makedepends=('innoextract' 'icoutils')
source=("https://ctpublic.ieway.cn/public/download/EVPlayer2_v4.8.2.exe")
sha256sums=('SKIP')

build() {
  innoextract EVPlayer2_v4.8.2.exe

  cd app
  wrestool -x --type=group_icon EVPlayer2.exe | icotool -x -o evplayer2.png -
}

package() {
  install -d "${pkgdir}/opt/evplayer2"
  cp -r app/* "${pkgdir}/opt/evplayer2/"

  install -Dm644 "${srcdir}/app/evplayer2.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/evplayer2.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/evplayer2.desktop" << EOF
[Desktop Entry]
Type=Application
Name=EVPlayer2
Comment=EV Encrypted Video Player
Exec=wine /opt/evplayer2/EVPlayer2.exe
Icon=evplayer2
Terminal=false
Categories=AudioVideo;Player;
EOF

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/evplayer2" << EOF
#!/bin/bash
wine /opt/evplayer2/EVPlayer2.exe "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/evplayer2"
}
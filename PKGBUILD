pkgname=echomusic-bin
pkgver=2.0.0
pkgrel=3
pkgdesc="A simple third-party KuGou concept version music player (Electron version)"
arch=('x86_64')
url="https://github.com/hoowhoami/EchoMusic"
license=('MIT')

depends=(
  'gtk3'
  'libglvnd'
  'nss'
  'alsa-lib'
  'libxkbcommon'
  'libkeybinder3'
  'libayatana-appindicator'
  'mpv'
  'xdg-utils'
)

provides=('echomusic')
conflicts=('echomusic')

options=('!strip')

source=(
  "EchoMusic-${pkgver}.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v${pkgver}/EchoMusic-${pkgver}-linux-amd64.deb"
)

sha256sums=('SKIP')

package() {

  cd "$srcdir"

  # 解包 deb
  ar x "EchoMusic-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  # Electron 程序通常放在 /opt 或 /usr/lib
  if [ -d "$pkgdir/usr/lib/echomusic" ]; then
    install -d "$pkgdir/opt"
    mv "$pkgdir/usr/lib/echomusic" "$pkgdir/opt/"
  fi

  if [ -d "$pkgdir/usr/share/echomusic" ]; then
    install -d "$pkgdir/opt"
    mv "$pkgdir/usr/share/echomusic" "$pkgdir/opt/"
  fi

  # 删除 upstream 自带 launcher
  rm -f "$pkgdir/usr/bin/echomusic"

  # 创建标准 launcher
  install -d "$pkgdir/usr/bin"

  cat > "$pkgdir/usr/bin/echomusic" << 'EOF'
#!/bin/sh
exec /opt/echomusic/EchoMusic "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/echomusic"

  # desktop 修复
  _desktop="$pkgdir/usr/share/applications/echomusic.desktop"
  if [[ -f "$_desktop" ]]; then
    sed -i 's|^Exec=.*|Exec=/usr/bin/echomusic %U|' "$_desktop"
    sed -i 's|^Icon=.*|Icon=echomusic|' "$_desktop"
  fi

}
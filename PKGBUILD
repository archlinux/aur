# Maintainer: kawuchuu <kawuchuu at gmail dot com>
pkgname=firetail-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Firetail music player"
arch=('x86_64')
url="https://github.com/kawuchuu/firetail"
license=('GPL3')
depends=('electron41')
options=('!strip' '!debug')

source=("firetail-$pkgver"::"https://github.com/kawuchuu/firetail/releases/download/v$pkgver/Firetail-linux-x64-$pkgver.zip")
sha256sums=('ebe029ea7d2b8248223fdf3dbad19876903325cce0d5da643726c597c285b001')

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r "$srcdir/Firetail-linux-x64/resources" "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/firetail" <<EOF
#!/bin/sh
exec electron41 /usr/lib/$pkgname/resources/app.asar "\$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/firetail.desktop" <<EOF
[Desktop Entry]
Name=Firetail
Comment=Firetail music player
Exec=firetail
Icon=firetail
Type=Application
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=firetail
EOF

  icon_dir="$pkgdir/usr/lib/$pkgname/resources/icons"

  if [[ -d "$icon_dir" ]]; then
    for size in 16 24 32 48 64 128 256 512; do
      src="$icon_dir/${size}x${size}.png"
      if [[ -f "$src" ]]; then
        install -Dm644 "$src" \
          "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/firetail.png"
      fi
    done
  fi
}
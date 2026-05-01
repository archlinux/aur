# Maintainer: kawuchuu <kawuchuu at gmail dot com>
pkgname=firetail-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Firetail music player"
arch=('x86_64')
url="https://github.com/kawuchuu/firetail"
license=('GPL3')
depends=('electron')
options=('!strip' '!debug')

source=("firetail-$pkgver"::"https://github.com/kawuchuu/firetail/releases/download/v$pkgver/Firetail-linux-x64-$pkgver.zip")
sha256sums=('446231f9d0d28de6ff31424c3c20150409fe41904eebb147f670529984cfc0d2')

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r "$srcdir/Firetail-linux-x64/resources" "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/firetail" <<EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/resources/app.asar "\$@"
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
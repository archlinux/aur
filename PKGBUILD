# Maintainer: Evilleader evilleader91@gmail.com

pkgname=feishin-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="Modern web-based music player (prebuilt binary)"
arch=('x86_64')
url="https://github.com/jeffvli/feishin"
license=('GPL3')

depends=('libnotify' 'nss' 'gtk3' 'alsa-lib')

provides=('feishin')
conflicts=('feishin')

source=(
  "Feishin-linux-x64-${pkgver}.tar.xz::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x64.tar.xz"
)

noextract=("feishin.tar.xz")

sha256sums=('a81cbffa4fa74de52048e0cf4a14698643a9b4ca8d4292f92e19b95dadb8aa81')

package() {
  mkdir -p "$pkgdir/opt/feishin"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  bsdtar -xf feishin.tar.xz -C "$pkgdir/opt/feishin"

  cat > "$pkgdir/usr/bin/feishin" << 'EOF'
#!/bin/bash
exec /opt/feishin/Feishin-linux-x64/feishin "$@"
EOF

  chmod +x "$pkgdir/usr/bin/feishin"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/feishin.desktop" << 'EOF'
[Desktop Entry]
Name=Feishin
GenericName=Music player
Exec=/usr/bin/feishin
Terminal=false
Type=Application
Icon=feishin
StartupWMClass=feishin
SingleMainWindow=true
Categories=AudioVideo;Audio;Player;Music;
Keywords=Navidrome;Jellyfin;Subsonic;OpenSubsonic
Comment=A player for your self-hosted music server
EOF

  install -Dm644 \
    "$pkgdir/opt/feishin/Feishin-linux-x64/resources/assets/icons/512x512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/feishin.png"
}

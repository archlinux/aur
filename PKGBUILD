# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=viber-appimage
pkgver=29.4.0.7
pkgrel=1
pkgdesc="Cross-platform VoIP and instant messaging application (official AppImage)"
arch=('x86_64')
url="https://www.viber.com/"
license=('LicenseRef-proprietary')
depends=('fuse2' 'glibc' 'hicolor-icon-theme')
provides=('viber')
conflicts=('viber')
options=('!strip' '!debug')

# Rolling: always fetch the latest official AppImage from Viber's CDN.
source=("viber.AppImage::https://download.cdn.viber.com/desktop/Linux/viber.AppImage")
noextract=('viber.AppImage')
sha256sums=('SKIP')

# Derive pkgver from the AppImage's bundled desktop metadata so the package
# version tracks upstream releases; makepkg re-runs this on every build.
pkgver() {
  cd "$srcdir"
  chmod +x viber.AppImage
  rm -rf squashfs-root
  ./viber.AppImage --appimage-extract com.viber.Viber.desktop >/dev/null 2>&1 || true

  local ver=""
  if [[ -f squashfs-root/com.viber.Viber.desktop ]]; then
    ver="$(sed -n 's/^X-AppImage-Version=//p' squashfs-root/com.viber.Viber.desktop | head -1)"
  fi
  rm -rf squashfs-root

  if [[ -n "$ver" ]]; then
    printf '%s\n' "$ver"
  else
    date +%Y%m%d
  fi
}

package() {
  install -Dm755 "$srcdir/viber.AppImage" \
    "$pkgdir/opt/viber/viber.AppImage"

  cd "$srcdir"
  chmod +x viber.AppImage
  rm -rf squashfs-root
  ./viber.AppImage --appimage-extract com.viber.Viber.desktop >/dev/null 2>&1 || true
  ./viber.AppImage --appimage-extract usr/share/icons/hicolor/256x256/apps/viber.png >/dev/null 2>&1 || true

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/viber" <<'EOF'
#!/bin/sh
exec /opt/viber/viber.AppImage "$@"
EOF

  if [[ -f squashfs-root/com.viber.Viber.desktop ]]; then
    sed 's|^Exec=.*|Exec=/usr/bin/viber %U|' \
      squashfs-root/com.viber.Viber.desktop \
      | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/viber.desktop"
  else
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/viber.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Viber
Comment=Viber VoIP and messenger
Exec=/usr/bin/viber %U
Icon=viber
Terminal=false
Categories=Network;InstantMessaging;P2P;
MimeType=x-scheme-handler/viber;
EOF
  fi

  if [[ -f squashfs-root/usr/share/icons/hicolor/256x256/apps/viber.png ]]; then
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/viber.png \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/viber.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/viber.png \
      "$pkgdir/usr/share/pixmaps/viber.png"
  fi

  rm -rf squashfs-root
}

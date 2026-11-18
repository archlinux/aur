# Maintainer: Reazndev <ruby.florian@proton.me>

pkgname=altersend-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Private peer-to-peer file transfer application (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://altersend.com/'
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss')
provides=('altersend')
conflicts=('altersend' 'altersend-git')
options=('!strip')
source_x86_64=("AlterSend-x86_64.AppImage::https://github.com/denislupookov/altersend/releases/download/v${pkgver}/AlterSend-x86_64.AppImage")
sha256sums_x86_64=('697863b20b41c270519a59bb09947b5ce6ae0a0b9d583681206cc9a755956d8a')
source_aarch64=("AlterSend-arm64.AppImage::https://github.com/denislupookov/altersend/releases/download/v${pkgver}/AlterSend-arm64.AppImage")
sha256sums_aarch64=('61fa2de7c00d7305de9253531648e878b850f4edfdbb8da15d3a63ca3f19e70c')

prepare() {
  cd "$srcdir"

  local appimage
  case "$CARCH" in
    x86_64) appimage=AlterSend-x86_64.AppImage ;;
    aarch64) appimage=AlterSend-arm64.AppImage ;;
  esac

  chmod +x "$appimage"
  "./$appimage" --appimage-extract
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/altersend"
  cp -a --no-preserve=ownership squashfs-root/. "$pkgdir/opt/altersend/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/altersend" <<'EOF'
#!/bin/sh
exec /opt/altersend/AppRun "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/altersend.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=AlterSend
Comment=Private peer-to-peer file transfer
Exec=altersend %U
Icon=altersend
Categories=Network;FileTransfer;
MimeType=application/octet-stream;inode/directory;x-scheme-handler/altersend;
StartupNotify=true
Terminal=false
StartupWMClass=altersend
EOF

  install -Dm644 squashfs-root/altersend.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/altersend.png"
}

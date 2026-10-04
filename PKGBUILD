# Maintainer: sunnysab <i@sunnysab.cn>
#
# Upstream ships an AppImage only. This unpacks that AppImage so pacman owns
# every file and the app cannot replace itself underneath the package.
pkgname=thinkwatch-lite-bin
pkgver=2026.10.1
pkgrel=1
pkgdesc="A local gateway for Claude Code, Codex and other AI clients"
arch=('x86_64')
url="https://github.com/ThinkWatchProject/ThinkWatch-Lite"
license=('MIT')
depends=('e2fsprogs' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'harfbuzz'
         'hicolor-icon-theme' 'libdrm' 'libglvnd' 'libgpg-error' 'libx11'
         'libxcb' 'mesa' 'wayland' 'zlib')
source=("ThinkWatch-Lite-$pkgver-x86_64.AppImage::https://github.com/ThinkWatchProject/ThinkWatch-Lite/releases/download/v$pkgver/ThinkWatch-Lite-$pkgver-x86_64.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ThinkWatchProject/ThinkWatch-Lite/v$pkgver/LICENSE")
sha256sums=('0a95403d88efa76d5d3ee7aae15d9d4e801433ba96aca4c8e2d2c3a054fe91e4'
            '7252131fc6a9010e307564a50152aeae79c6bde89665b3e4b3f2aca9591749dd')

build() {
  chmod +x "ThinkWatch-Lite-$pkgver-x86_64.AppImage"
  ./"ThinkWatch-Lite-$pkgver-x86_64.AppImage" --appimage-extract > /dev/null
  cd squashfs-root

  # The AppImage carries the graphics stack of the distribution it was built
  # on. WebKitGTK asks Mesa for an EGL display, Mesa loads the bundled
  # libwayland-client, and on a host with a newer Wayland that call fails with
  # EGL_BAD_PARAMETER: the web process dies and the window stays blank.
  # Removing these four makes Mesa and GTK use the host's copies.
  rm -f usr/lib/libwayland-client.so.0 usr/lib/libwayland-cursor.so.0 \
        usr/lib/libwayland-egl.so.1 usr/lib/libwayland-server.so.0

  # Extraction does not restore the AppDir's modes; the executable bit is put
  # back on the files that carry it in the mounted image.
  find . -type f -exec chmod 644 {} +
  find . -type d -exec chmod 755 {} +
  chmod 755 AppRun AppRun.wrapped usr/bin/* "usr/lib/ThinkWatch Lite/twcore" \
            usr/lib/*-linux-gnu/webkit2gtk-4.1/WebKit*
}

package() {
  cd squashfs-root

  install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  # The whole AppDir: AppRun.wrapped reads `Exec=` from the .desktop file in the
  # AppDir root, so that file has to stay next to AppRun.
  cp -a . "$pkgdir/opt/$pkgname/"

  printf '#!/bin/sh\nexec /opt/%s/AppRun "$@"\n' "$pkgname" > "$pkgdir/usr/bin/${pkgname%-bin}"
  chmod 755 "$pkgdir/usr/bin/${pkgname%-bin}"

  # The app writes this entry itself when it runs as an AppImage, so that
  # thinkwatch:// (the sign-in callback) finds it; as a package the entry is
  # ours instead, under the app's own identifier for notification attribution.
  cat > "$pkgdir/usr/share/applications/app.thinkwatch.lite.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=ThinkWatch Lite
Comment=Local gateway for Claude Code, Codex and other AI clients
Exec=/usr/bin/thinkwatch-lite %u
Icon=app.thinkwatch.lite
Terminal=false
Categories=Development;
MimeType=x-scheme-handler/thinkwatch;
StartupWMClass=thinkwatch-lite
EOF
  chmod 644 "$pkgdir/usr/share/applications/app.thinkwatch.lite.desktop"

  for size in 32 128 256 512; do
    install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/thinkwatch-lite.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/app.thinkwatch.lite.png"
  done

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

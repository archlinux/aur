# Maintainer: Vsevolod Balashov <vsevolod.balashov@yandex.ru>
# Package repo: https://gitverse.ru/sevkin/shardx-launcher-aur
# Upstream: https://github.com/ProxyShard/ShardBrowser

pkgname=shardx-launcher-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="ShardX anti-detect browser launcher (prebuilt AppImage installed to /opt/shardx, runs against system Mesa/Wayland)"
arch=('x86_64')
url="https://github.com/ProxyShard/ShardBrowser"
license=('MIT')
depends=('hicolor-icon-theme' 'mesa' 'harfbuzz' 'graphite' 'libgpg-error'
         'e2fsprogs' 'libx11' 'bzip2' 'fontconfig' 'freetype2' 'fribidi'
         'wayland')
options=('!strip')
# The launcher itself is MIT; the browser engine it downloads at runtime is
# a closed-source binary with its own restrictions (see the project README).
source=("${pkgname%-bin}.AppImage::https://github.com/ProxyShard/ShardBrowser/releases/download/v${pkgver}/ShardX.Launcher_${pkgver}_amd64.AppImage"
        "shardx-launcher.desktop")
sha256sums=(
            '9de1325d4ead16fa48bf30382865f930344e16f6523f23b4b931f79e6c2dfa1e'
            '3617af983c16d6d999f45bac141ff218656ad05ffc20146ad8a2b3a597150f5e'
)

build() {
  cd "$srcdir"
  chmod +x "${pkgname%-bin}.AppImage"
  ./"${pkgname%-bin}.AppImage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"

  install -d "$pkgdir/opt/shardx"

  # Preserve the full AppDir layout so the AppRun.wrapped launcher can resolve
  # its own path (/proc/self/exe), .desktop metadata, bundled libraries, and
  # glib/gsettings schemas exactly as it does inside the AppImage.
  cp -a AppRun AppRun.wrapped apprun-hooks "$pkgdir/opt/shardx/"
  chmod 755 "$pkgdir/opt/shardx/AppRun" "$pkgdir/opt/shardx/AppRun.wrapped"
  cp -a usr "$pkgdir/opt/shardx/"
  cp -a "ShardX Launcher.png" "$pkgdir/opt/shardx/"
  ln -s "usr/share/applications/ShardX Launcher.desktop" \
    "$pkgdir/opt/shardx/ShardX Launcher.desktop"

  # Drop the bundled (stale) Wayland runtime. It conflicts with the host's
  # modern Mesa/EGL and triggers "Could not create default EGL display:
  # EGL_BAD_PARAMETER" in WebKitGTK. Let the binary resolve the system
  # libwayland-*.so.0 instead (pulled in via the 'wayland' dependency).
  rm -f "$pkgdir/opt/shardx/usr/lib"/libwayland-client.so.0 \
        "$pkgdir/opt/shardx/usr/lib"/libwayland-cursor.so.0 \
        "$pkgdir/opt/shardx/usr/lib"/libwayland-egl.so.1 \
        "$pkgdir/opt/shardx/usr/lib"/libwayland-server.so.0

  # Normalize permissions carried over from the source AppImage (some data files
  # shipped with the execute bit set). Fix them to 644; leave real binaries and
  # shared libraries untouched.
  find "$pkgdir/opt/shardx/usr" -type f \
    \( -name '*.xml' -o -name '*.dtd' -o -name '*.override' -o -name 'copyright' \
       -o -name '*.png' -o -name '*.cache' \) \
    -exec chmod 644 {} +

  # Launcher entry point. Disable WebKitGTK's GPU compositor and DMABUF
  # renderer to avoid a blank/white window on XWayland (e.g. NVIDIA/EGL).
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/shardx-launcher" <<'EOF'
#!/bin/sh
export GDK_BACKEND=x11
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /opt/shardx/AppRun "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/shardx-launcher"

  # Icons
  for size in 32x32 128x128; do
    install -Dm644 "usr/share/icons/hicolor/$size/apps/shardx-launcher.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/shardx-launcher.png"
  done
  install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/shardx-launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/shardx-launcher.png"

  # Desktop entry
  install -Dm644 "$srcdir/shardx-launcher.desktop" \
    "$pkgdir/usr/share/applications/shardx-launcher.desktop"
}

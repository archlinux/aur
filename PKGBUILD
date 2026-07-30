_FORCE_ts=20260730054939
# Maintainer: Geequlim <geequlim@gmail.com>

# Ensure UTF-8 locale for files with non-ASCII names during packaging.
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

pkgname=cosbrowser-bin
pkgver=2.11.26
_upstream_ver=2.11.26
_zip_url=https://cosbrowser.cloud.tencent.com/cosbrowser-latest-linux.zip
pkgrel=3
pkgdesc='Tencent Cloud COS client (repacked from official AppImage)'
arch=('x86_64')
url='https://cosbrowser.cloud.tencent.com/'
license=('custom')
depends=('hicolor-icon-theme' 'desktop-file-utils')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("cosbrowser-linux.zip::${_zip_url}")
sha256sums=('390f2654dc3b78e5dd4439213631a33870cd0479208721bd3c02e79d03d3dd37')
options=('!strip')

prepare() {
  cd "$srcdir"

  # Clean previous extraction artifacts.
  rm -rf squashfs-root cosbrowser-*.AppImage

  # Unzip only the AppImage; ignore the macOS __MACOSX junk.
  bsdtar -xf cosbrowser-linux.zip --exclude='__MACOSX' --exclude='*/.*'

  local appimage
  appimage=$(find . -maxdepth 1 -type f -name 'cosbrowser-*.AppImage' -print -quit || true)
  if [[ -z "$appimage" ]]; then
    echo "cosbrowser AppImage not found in upstream zip" >&2
    exit 1
  fi

  chmod +x "$appimage"
  ./"$appimage" --appimage-extract >/dev/null

  # Prefer the desktop file shipped inside the AppImage.
  local desktop_src
  desktop_src=$(find squashfs-root -type f -name '*.desktop' -print -quit || true)
  if [[ -n "$desktop_src" ]]; then
    cp "$desktop_src" "$srcdir/cosbrowser.desktop"
  else
    cat > "$srcdir/cosbrowser.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=cosbrowser
Exec=cosbrowser
Icon=cosbrowser
Categories=Utility;
Terminal=false
Comment=COSBrowser - Tencent Cloud COS Client
DESKTOP
  fi

  # Force the wrapper script as the Exec target. These flags are required for
  # the app to launch: --no-sandbox (no SUID chrome-sandbox under /opt) and
  # --disable-gpu (avoids GPU init failures / blank window on some setups).
  sed -i 's/^Exec=.*/Exec=cosbrowser --no-sandbox --disable-gpu %U/' "$srcdir/cosbrowser.desktop"

  # Normalize Icon to the package name (it already is, but be safe against paths).
  if grep -Eq '^Icon=.+/' "$srcdir/cosbrowser.desktop" || grep -Eq '^Icon=.+\.png$' "$srcdir/cosbrowser.desktop"; then
    sed -i 's/^Icon=.*/Icon=cosbrowser/' "$srcdir/cosbrowser.desktop"
  fi

  if ! grep -q '^Name=' "$srcdir/cosbrowser.desktop"; then
    echo 'Name=cosbrowser' >> "$srcdir/cosbrowser.desktop"
  fi

  # Stash a copy of the main icon (the AppImage ships a single 0x0 entry that
  # most desktop environments cannot resolve, so we reinstall it at a standard
  # hicolor size in package()).
  local icon_src
  icon_src=$(find squashfs-root/usr/share/icons -type f -name 'cosbrowser.png' -print -quit 2>/dev/null || true)
  if [[ -z "$icon_src" ]]; then
    icon_src=$(find squashfs-root -maxdepth 1 -type f -name 'cosbrowser.png' -print -quit 2>/dev/null || true)
  fi
  if [[ -n "$icon_src" ]]; then
    cp "$icon_src" "$srcdir/cosbrowser.png"
  fi
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/cosbrowser"
  cp -a --no-preserve=ownership squashfs-root/. "$pkgdir/opt/cosbrowser/"
  chmod -R a+rX "$pkgdir/opt/cosbrowser"
  [[ -f "$pkgdir/opt/cosbrowser/AppRun" ]] && chmod 755 "$pkgdir/opt/cosbrowser/AppRun"

  # Wrapper script. Both --no-sandbox (no SUID chrome-sandbox under /opt) and
  # --disable-gpu are required for the app to launch reliably. We also reuse
  # the Wayland-hybrid workaround from layaair-ide since this is also an
  # Electron app that can render a black window on native Wayland.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cosbrowser" <<'EOF_WRAPPER'
#!/bin/sh

# Required launch flags: --no-sandbox (no SUID chrome-sandbox under /opt) and
# --disable-gpu (avoids GPU init failures / blank window on some setups).
set -- --no-sandbox --disable-gpu "$@"

# Electron can render a black window on native Wayland with hybrid
# Intel/NVIDIA graphics. Prefer XWayland there, while allowing callers to
# select an Ozone backend explicitly.
if [ "${XDG_SESSION_TYPE:-}" = 'wayland' ] && [ -n "${DISPLAY:-}" ]; then
  has_ozone_platform=false
  for arg in "$@"; do
    case "$arg" in
      --ozone-platform|--ozone-platform=*)
        has_ozone_platform=true
        break
        ;;
    esac
  done

  if [ "$has_ozone_platform" = false ]; then
    set -- --ozone-platform=x11 "$@"
  fi
fi

exec /opt/cosbrowser/AppRun "$@"
EOF_WRAPPER

  install -Dm644 "$srcdir/cosbrowser.desktop" \
    "$pkgdir/usr/share/applications/cosbrowser.desktop"

  # Install the icon at a standard hicolor size. The upstream AppImage only
  # ships a broken 0x0 entry, so do NOT copy its icons tree verbatim; install
  # the single png at 512x512 (the file is high enough resolution).
  if [[ -f "$srcdir/cosbrowser.png" ]]; then
    install -Dm644 "$srcdir/cosbrowser.png" \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/cosbrowser.png"
  fi
}

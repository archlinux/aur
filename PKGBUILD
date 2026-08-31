# Maintainer: OmO Desktop maintainers <minpeter@users.noreply.github.com>

pkgname=omo-desktop-bin
pkgver=0.0.33
pkgrel=1
pkgdesc='Desktop control surface for local coding agents'
arch=('x86_64')
url='https://github.com/minpeter/omo-desktop-releases'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
  'zlib'
)
provides=("omo-desktop=$pkgver")
conflicts=('omo-desktop' 't3code-bin' 't3code')
replaces=('t3code-bin')
options=('!debug' '!strip')

_appimage="OmO-${pkgver}-${CARCH}.AppImage"
source=(
  "$_appimage::https://github.com/minpeter/omo-desktop-releases/releases/download/v${pkgver}/$_appimage"
  "${pkgname}-${pkgver}-LICENSE::https://github.com/minpeter/omo-desktop-releases/releases/download/v${pkgver}/LICENSE"
)
sha256sums=(
  '46a5fcd872d07a472d58107213d62a22402fafada9ebf1c3a26e343b100793db' # AppImage
  '884447aa26618ad7e223c3fab32357c6a11a07da625efb49ec7840d77666e3f1' # release license
)

prepare() {
  chmod +x "$srcdir/$_appimage"
  rm -rf "$srcdir/squashfs-root"
  "$srcdir/$_appimage" --appimage-extract >/dev/null

  if [[ ! -x "$srcdir/squashfs-root/AppRun" ||
        ! -f "$srcdir/squashfs-root/chrome-sandbox" ]]; then
    echo 'The AppImage payload is missing its launcher or Chromium sandbox.' >&2
    return 1
  fi
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a --no-preserve=ownership "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/opt/$pkgname"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omo-desktop" <<'EOF'
#!/bin/sh
set -eu

gpu_available=false
for render_node in /dev/dri/renderD*; do
  if [ -r "$render_node" ]; then
    gpu_available=true
    break
  fi
done
if [ "$gpu_available" = false ]; then
  set -- --disable-gpu "$@"
fi
# Chromium's shared-memory path becomes unreliable below 256 MiB (262144 KiB).
shm_available_kib=0
if [ -d /dev/shm ] && [ -w /dev/shm ]; then
  shm_available_kib="$(df -Pk /dev/shm | awk 'NR == 2 { print $4 }')"
fi
if [ "${shm_available_kib:-0}" -lt 262144 ]; then
  set -- --disable-dev-shm-usage "$@"
fi

exec /opt/omo-desktop-bin/AppRun "$@"
EOF

  local icon size_dir
  for icon in "$srcdir"/squashfs-root/usr/share/icons/hicolor/*/apps/omo.png; do
    size_dir="${icon%/apps/omo.png}"
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/${size_dir##*/}/apps/omo.png"
  done

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/omo.desktop" <<'EOF'
[Desktop Entry]
Name=OmO
Comment=Desktop control surface for local coding agents
Exec=omo-desktop %U
TryExec=omo-desktop
Terminal=false
Type=Application
Icon=omo
StartupWMClass=omo
Categories=Development;
MimeType=x-scheme-handler/omo;x-scheme-handler/omo-dev;
EOF

  install -Dm644 "$srcdir/${pkgname}-${pkgver}-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

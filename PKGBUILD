# Maintainer: maria-rcks <maria at kuuro dot net>

pkgname=t3code-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Desktop control surface for local coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/pingdotgg/t3code'
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
optdepends=('openai-codex: use the system-installed Codex CLI')
provides=("t3code=$pkgver")
conflicts=('t3code')
options=('!debug' '!strip')

_appimage="T3-Code-${pkgver}-${CARCH/aarch64/arm64}.AppImage"
_asset_x86_64="T3-Code-x86_64.AppImage"
_asset_aarch64="T3-Code-arm64.AppImage"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pingdotgg/t3code/v${pkgver}/LICENSE")
sha256sums=('935d8f2af0c703f9c39517ee57cc4930b19d02d533be930b63f0e82f93614b43') # upstream license
source_x86_64=("T3-Code-${pkgver}-x86_64.AppImage::https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/$_asset_x86_64")
sha256sums_x86_64=('dac1bbe9e93c1a5fb0942332befa998597f6a086232a87766ef5d8235a44f56d')
source_aarch64=("T3-Code-${pkgver}-arm64.AppImage::https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/$_asset_aarch64")
sha256sums_aarch64=('47156eade4d3e8c635554f859a590e15614d63b6d9792dd7684bdecae365ec41')

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

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/t3code" <<'EOF'
#!/bin/sh
# AppRun computes APPDIR but doesn't export it. The server's AppImage env scrub needs it
# to keep /opt/t3code-bin/usr/lib etc. out of terminal and agent shells (#28993).
exec env APPDIR=/opt/t3code-bin /opt/t3code-bin/AppRun "$@"
EOF
  ln -s t3code "$pkgdir/usr/bin/t3-code-desktop"

  # Icon lookup only sees sizes registered in hicolor's index.theme (max 512x512).
  local icon size_dir
  for icon in "$srcdir"/squashfs-root/usr/share/icons/hicolor/*/apps/t3code.png; do
    size_dir="${icon%/apps/t3code.png}"
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/${size_dir##*/}/apps/t3code.png"
  done

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/t3code.desktop" <<'EOF'
[Desktop Entry]
Name=T3 Code
Comment=Desktop control surface for local coding agents
Exec=t3code %U
TryExec=t3code
Terminal=false
Type=Application
Icon=t3code
StartupWMClass=com.t3tools.T3Code
Categories=Development;
MimeType=x-scheme-handler/t3code;
EOF

  install -Dm644 "$srcdir/${pkgname}-${pkgver}-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

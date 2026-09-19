# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
#
# Unofficial Linux package of Cline for Desktop (upstream: cline/cline).
# Not affiliated with Cline. Upstream GitHub releases currently ship macOS and
# Windows only (https://cline.bot/desktop); this PKGBUILD builds the same
# tagged source (Tauri 2 + Bun sidecar) for Linux. In-app auto-update is
# disabled so pacman/yay own upgrades.

pkgname=cline-desktop
pkgver=0.0.32
pkgrel=2
pkgdesc="Cline coding agent as a native desktop app (unofficial Linux build)"
arch=('x86_64' 'aarch64')
url="https://cline.bot/desktop"
license=('Apache-2.0')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun'
  'cargo'
  'git'
  'pkgconf'
  'python'
  'imagemagick'
)
optdepends=(
  'github-cli: pull-request status in the composer'
  'libappindicator: system tray icon'
  'libayatana-appindicator: system tray icon (Ayatana)'
  'xdg-desktop-portal-gtk: native file picker on Wayland'
)
options=('!lto' '!debug')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/cline/cline/archive/refs/tags/desktop-v$pkgver.tar.gz"
  'cline-desktop.desktop'
)
sha256sums=(
  '19199a217201750acb7d22dca6d6a43ae37616500bfa468d6201c6a2afac89cf'
  'fe4591dabfdbe6a62389ed7c7ccc7041ab9f83d21a1cde0bd806d06fabc0ae33'
)

_srcdir="cline-desktop-v$pkgver"
_appdir="apps/examples/desktop-app"

prepare() {
  cd "$srcdir/$_srcdir"

  python - <<'PY'
import json
from pathlib import Path

path = Path("apps/examples/desktop-app/src-tauri/tauri.conf.json")
cfg = json.loads(path.read_text())
cfg["mainBinaryName"] = "cline-desktop"
cfg.setdefault("bundle", {})["targets"] = ["deb"]
plugins = cfg.setdefault("plugins", {})
updater = plugins.setdefault("updater", {})
# Empty endpoints disable the in-app updater (see updates_enabled() in main.rs).
updater["endpoints"] = []
path.write_text(json.dumps(cfg, indent=2) + "\n")
PY

  bun install --frozen-lockfile

  cd "$_appdir/src-tauri"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$srcdir/$_srcdir"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"

  # Same order as .github/workflows/desktop-publish.yml: SDK packages (including
  # @cline/shared/browser) must exist before Tauri's beforeBuildCommand builds @cline/ui.
  bun run build:sdk

  cd "$_appdir"
  bun run build:binary -- --bundles deb
}

package() {
  cd "$srcdir/$_srcdir"

  local deb data
  deb="$(find "$_appdir/src-tauri/target/release/bundle/deb" -maxdepth 1 -name '*.deb' -print -quit)"
  if [[ -z "$deb" ]]; then
    echo "error: Tauri did not produce a .deb under src-tauri/target/release/bundle/deb" >&2
    return 1
  fi

  data="$(bsdtar -tf "$deb" | grep -E '^data\.tar\.' | head -1)"
  if [[ -z "$data" ]]; then
    echo "error: no data.tar.* inside $deb" >&2
    return 1
  fi
  bsdtar -xOf "$deb" "$data" | bsdtar -x -C "$pkgdir"

  # Stable launcher name, regardless of what the deb called the binary.
  if [[ -x "$pkgdir/usr/bin/cline-desktop" ]]; then
    :
  elif [[ -x "$pkgdir/usr/bin/cline-app" ]]; then
    mv "$pkgdir/usr/bin/cline-app" "$pkgdir/usr/bin/cline-desktop"
  else
    local bin
    bin="$(find "$pkgdir/usr/bin" -type f -executable -print -quit)"
    if [[ -z "$bin" ]]; then
      echo "error: no executable installed under /usr/bin" >&2
      return 1
    fi
    mv "$bin" "$pkgdir/usr/bin/cline-desktop"
  fi

  install -Dm644 "$srcdir/cline-desktop.desktop" \
    "$pkgdir/usr/share/applications/cline-desktop.desktop"
  find "$pkgdir/usr/share/applications" -name '*.desktop' ! -name 'cline-desktop.desktop' -delete

  # Tauri's deb ships 32/128 plus a 256x256@2 HiDPI path that Qt/Vicinae never
  # look up. Install the usual hicolor sizes + pixmaps so launchers resolve Icon=.
  rm -rf "$pkgdir/usr/share/icons/hicolor/"*"@2"
  local src_icon=""
  local f
  for f in \
      "$_appdir/src-tauri/icons/icon.png" \
      "$_appdir/src-tauri/icons/128x128.png" \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/"*.png
  do
    [[ -f "$f" ]] && src_icon="$f" && break
  done
  if [[ -z "$src_icon" ]]; then
    echo "error: no source icon to install" >&2
    return 1
  fi
  local sz
  for sz in 16 24 32 48 64 128 256 512; do
    magick "$src_icon" -resize "${sz}x${sz}" "$srcdir/cline-desktop-${sz}.png"
    install -Dm644 "$srcdir/cline-desktop-${sz}.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/cline-desktop.png"
  done
  install -Dm644 "$srcdir/cline-desktop-128.png" \
    "$pkgdir/usr/share/pixmaps/cline-desktop.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_appdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.46.0
pkgrel=1
pkgdesc="Goose Desktop (built from source) - an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=("x86_64")
url="https://github.com/aaif-goose/goose"
license=("Apache-2.0")
depends=(
  "glibc"
  "gcc-libs"
  "gtk3"
  "libnotify"
  "nss"
  "xdg-utils"
  "at-spi2-core"
  "libdrm"
  "mesa"
  "libxcb"
  "alsa-lib"
  "trash-cli"
  "vulkan-icd-loader"
)
optdepends=("libcups: printing support")
makedepends=(
  "cargo"
  "clang"
  "cmake"
  "nodejs"
  "pnpm"
  "just"
  "vulkan-headers"
  "shaderc"
)

# LTO breaks sqlx/sqlite linkage
options=("!lto" "!debug")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aaif-goose/goose/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  '30a48c2ef993bf9af712bb9cb23382cae10a5e4caa1820f4dcbbea01e1bdaef530c494b63d7b2f0b7e3a21c829eb18be93d2505e0274e1d23faa10e3e7f06886'
)
conflicts=("goose-desktop-bin")
provides=("goose-desktop")

prepare() {
  cd "goose-${pkgver}"

  # Hide menu bar on Linux
  sed -i '/useContentSize: true/a\    autoHideMenuBar: process.platform === '\''linux'\'',' \
    ui/desktop/src/main.ts
}

build() {
  cd "goose-${pkgver}"

  # Build the goose CLI; the desktop UI talks ACP to this binary directly
  cargo build --release --features vulkan -p goose-cli --bin goose
  just copy-binary

  cd ui/desktop

  pnpm install

  pnpm run package
}

package() {
  cd "goose-${pkgver}"

  install -Dm755 "target/release/goose" "$pkgdir/usr/bin/goose"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r "ui/desktop/out/Goose-linux-x64/"* "$pkgdir/usr/lib/$pkgname/"

  # Provide a launcher script that respects user flags (e.g., ~/.config/goose-desktop-flags.conf for Wayland)
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
EXEC="/usr/lib/goose-desktop/Goose"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="$XDG_CONFIG_HOME/goose-desktop-flags.conf"
if [[ -f "$FLAGS_FILE" ]]; then
  GOOSE_USER_FLAGS="$(sed 's/#.*//' "$FLAGS_FILE" | tr '\n' ' ')"
fi
exec "$EXEC" "$@" ${GOOSE_USER_FLAGS:-}
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Desktop entry: route via launcher script and set StartupWMClass for Wayland window matching
  install -Dm644 ui/desktop/forge.deb.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i \
    -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
    -e "s|/usr/share/pixmaps/goose.png|/usr/share/pixmaps/$pkgname.png|g" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  if ! grep -q '^StartupWMClass=' "$pkgdir/usr/share/applications/$pkgname.desktop"; then
    echo "StartupWMClass=Goose" >> "$pkgdir/usr/share/applications/$pkgname.desktop"
  else
    sed -i 's|^StartupWMClass=.*|StartupWMClass=Goose|' "$pkgdir/usr/share/applications/$pkgname.desktop"
  fi

  install -Dm644 ui/desktop/out/Goose-linux-x64/resources/images/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

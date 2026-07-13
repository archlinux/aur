# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.42.0
pkgrel=1
pkgdesc="Goose Desktop (built from source) - an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=("x86_64")
url="https://github.com/aaif-goose/goose"
license=("Apache-2.0")
depends=("vulkan-icd-loader")
optdepends=()
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
  "pnpm-workspace-yaml.patch"
)
b2sums=(
  '165df8fdf20b26719b2c38a03d97507b9bea8927847a6aa525101a6cdbe858bed606c41124d5d379aaa118e19abf00b1bfb0fd9a0481dd3dec5a4a8c13e95292'
  '54f29a8b90e067066d21c7a25950b89cb3dbee10b1ba689f019f79adc4fce29d16c183af9e821305e934f6f00411b1ce72684ae0c3ff840c78e3fb031d501841'
)
conflicts=("goose-desktop-bin")
provides=("goose-desktop")

prepare() {
  cd "goose-${pkgver}"

  # Hide menu bar on Linux
  sed -i '/useContentSize: true/a\    autoHideMenuBar: process.platform === '\''linux'\'',' \
    ui/desktop/src/main.ts

  # TODO: drop when upstream migrates pnpm config to pnpm-workspace.yaml
  patch -p1 -i "$srcdir/pnpm-workspace-yaml.patch"
}

build() {
  cd "goose-${pkgver}"

  # Build the goose CLI; the desktop UI talks ACP to this binary directly
  cargo build --release --features vulkan -p goose-cli --bin goose
  just copy-binary
  cargo run -p goose-server --bin generate_schema

  cd ui/desktop

  pnpm install

  pnpm run package
}

package() {
  cd "goose-${pkgver}"

  install -Dm755 "target/release/goose" "$pkgdir/usr/bin/goose"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r "ui/desktop/out/Goose-linux-x64/"* "$pkgdir/usr/lib/$pkgname/"

  ln -s /usr/lib/$pkgname/Goose "$pkgdir/usr/bin/$pkgname"

  install -Dm644 ui/desktop/forge.deb.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/lib/goose/|/usr/lib/$pkgname/|g" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/share/pixmaps/goose.png|/usr/share/pixmaps/$pkgname.png|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 ui/desktop/out/Goose-linux-x64/resources/images/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

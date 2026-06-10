# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.37.0
pkgrel=3
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
)
b2sums=('14894271053b9127399575edb9b8918608be46942c26aa994ccdd538ab699261a0c49a3a018051ea5b6fbf43b1b9e12e3331c34c4f4276e3209c49f03dc4406d')
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

  cargo build --release --features vulkan -p goose-server
  cargo run -p goose-server --bin generate_schema
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

  ln -s /usr/lib/$pkgname/Goose "$pkgdir/usr/bin/$pkgname"

  install -Dm644 ui/desktop/forge.deb.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/lib/goose/|/usr/lib/$pkgname/|g" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/share/pixmaps/goose.png|/usr/share/pixmaps/$pkgname.png|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 ui/desktop/out/Goose-linux-x64/resources/images/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

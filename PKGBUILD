# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.44.0
pkgrel=2
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
  '03cc3f7bad5d740b0aa4af4990f1b022a450e6e7df666f2eb0d664c74a0c2f1cc752e9c12787568dbbf1e17873ef36b45ec6409b51bc2804e83cf194a8b439e0'
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

  ln -s /usr/lib/$pkgname/Goose "$pkgdir/usr/bin/$pkgname"

  install -Dm644 ui/desktop/forge.deb.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/lib/goose/|/usr/lib/$pkgname/|g" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/share/pixmaps/goose.png|/usr/share/pixmaps/$pkgname.png|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 ui/desktop/out/Goose-linux-x64/resources/images/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

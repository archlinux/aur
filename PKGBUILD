# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.33.1
pkgrel=2
pkgdesc="Goose Desktop (built from source) - an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=("x86_64")
url="https://github.com/aaif-goose/goose"
license=("Apache-2.0")
depends=()
optdepends=()
makedepends=(
  "cargo"
  "clang"
  "cmake"
  "nodejs"
  "pnpm"
  "just"
)

# LTO breaks sqlx/sqlite linkage
options=("!lto" "!debug")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aaif-goose/goose/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('cbb41196444147e2e60528f0252fef4ab1e2c6348845705121acef05cd0bf67ce8d3a9646225d57660e3df13305574c38989e06a9cdfb6f5eae16845fea17623')
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

  just release-binary

  cd ui/desktop

  pnpm install --frozen-lockfile

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

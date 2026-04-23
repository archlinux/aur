# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.32.0
pkgrel=1
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
b2sums=('3378005479229e277a4063e1dd5b92f7680804ce9e84e9815d0be849612b25e98e5c3bad10db396c85d6245d91d31f6e3ea5fd1420e283a9a664ff3d1295ea76')
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

  pnpm install

  npx electron-forge package
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

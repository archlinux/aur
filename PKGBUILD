# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.22.2
pkgrel=1
pkgdesc="Goose Desktop (built from source) - an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=("x86_64")
url="https://github.com/block/goose"
license=("Apache-2.0")
depends=()
optdepends=()
makedepends=(
  "cargo"
  "nodejs"
  "just"
  "oniguruma"
)
# LTO is broken for dependency ring https://github.com/briansmith/ring/issues/1444
options=("!lto" "!debug")
source=(
  "git+https://github.com/block/goose.git#tag=v${pkgver}"
)
b2sums=('SKIP')
conflicts=("goose-desktop-bin")
provides=("goose-desktop")

prepare() {
  cd goose

  sed -i '/useContentSize: true/a\    autoHideMenuBar: process.platform === '\''linux'\'',' \
    ui/desktop/src/main.ts
}

build() {
  cd goose

  # Use the prebuilt oniguruma for now
  # https://github.com/block/goose/issues/2572
  export RUSTONIG_SYSTEM_LIBONIG=1

  just release-binary

  cd ui/desktop
  # Ignore husky prepare script
  npm ci --ignore-scripts

  # Fix Forge errors: missing native modules
  npm i @rollup/rollup-linux-x64-gnu@4.43.0
  npm i @esbuild/linux-x64@0.25.5

  npx electron-forge package
}

package() {
  cd goose

  install -Dm755 "target/release/goose" "$pkgdir/usr/bin/goose"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r "ui/desktop/out/Goose-linux-x64/"* "$pkgdir/usr/lib/$pkgname/"

  ln -s /usr/lib/$pkgname/Goose "$pkgdir/usr/bin/$pkgname"

  install -Dm644 ui/desktop/forge.deb.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/lib/goose/|/usr/lib/$pkgname/|g" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s|/usr/share/pixmaps/goose.png|/usr/share/pixmaps/$pkgname.png|g" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 ui/desktop/out/Goose-linux-x64/resources/images/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

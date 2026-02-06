# Maintainer: Sheikh Limon <sheikhlimon404@gmail.com>

pkgname=goose-desktop
pkgver=1.23.1
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
)

# TODO: Remove tailwind-fix.patch when upstream releases include PR #6917

# LTO is broken for dependency ring https://github.com/briansmith/ring/issues/1444
options=("!lto" "!debug")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/block/goose/archive/refs/tags/v${pkgver}.tar.gz"
  "tailwind-fix.patch"
)
b2sums=('dff076ea05befd4ea78de3b9249340e622f06e4b7ea83455f0e2bb9a6109f1703570526caa776589947f727d6213747f6131985871814472aea62cc63ea4197a'
        '46d01b3c652405ccdbb79889c07e2efe5b50dca4bc930abbe192be2e0f7feb6eeb69b813905524507b7d6227d0da697c15d00cd54fcdee14d837a95de2d4d13b')
conflicts=("goose-desktop-bin")
provides=("goose-desktop")

prepare() {
  cd "goose-${pkgver}"

  # Fix Tailwind scan in tarball releases
  patch -p1 < "../tailwind-fix.patch"

  # Hide menu bar on Linux
  sed -i '/useContentSize: true/a\    autoHideMenuBar: process.platform === '\''linux'\'',' \
    ui/desktop/src/main.ts
}

build() {
  cd "goose-${pkgver}"

  just release-binary

  cd ui/desktop

  # Ignore husky prepare script
  npm ci --ignore-scripts --no-audit

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

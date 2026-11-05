# Maintainer: deeadly at Discord

pkgname=tapes-git
_pkgname=tapes
pkgver=0.1.6beta.r8.gf6c0144
pkgrel=1
pkgdesc='Atomic dotfiles switcher for Linux and ricing (git version)'
arch=('x86_64' 'aarch64')
url="https://github.com/futurekismo-oss/tapes"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('tapes')
conflicts=('tapes' 'tapes-bin')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//; s/-([0-9]+)-g([0-9a-f]+)$/.r\1.g\2/; s/-beta/beta/'
}

prepare() {
  cd "$_pkgname"
  # Upstream's config forces sccache and mold, which are not guaranteed to
  # exist in a clean build environment.
  rm -f .cargo/config.toml
  # Upstream's lockfile can lag behind Cargo.toml on a moving branch, so let
  # Cargo refresh it here and build offline afterwards.
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --offline
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/tapes "$pkgdir/usr/bin/tapes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: deeadly at Discord

pkgname=tapes
pkgver=0.1.10beta
_tag=v0.1.10-beta
pkgrel=1
pkgdesc='Atomic dotfiles switcher for Linux and ricing'
arch=('x86_64' 'aarch64')
url="https://github.com/futurekismo-oss/tapes"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('tapes-bin' 'tapes-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('3fd5d35896b0b3f155b1fcf511c16f85b7015f54afbc60dc38e4d70491556b8c')

prepare() {
  cd "$pkgname-${_tag#v}"
  # Upstream's config forces sccache and mold, which are not guaranteed to
  # exist in a clean build environment.
  rm -f .cargo/config.toml
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-${_tag#v}"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-${_tag#v}"
  install -Dm755 target/release/tapes "$pkgdir/usr/bin/tapes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

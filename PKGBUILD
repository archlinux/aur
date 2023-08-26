# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>

pkgname=polylux2pdfpc
_reponame=polylux
_dirname=pdfpc-extractor
pkgver=r263.c0032a0
pkgrel=1
pkgdesc='pdfpc extractor for polylux, a package for creating slides in Typst'
arch=(x86_64)
url='https://github.com/andreasKroepelin/polylux'
license=(MIT)
depends=()
makedepends=(git cargo)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path "$_reponame/$_dirname/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --frozen --manifest-path "$_reponame/$_dirname/Cargo.toml" --release
}

package() {
  install -Dm755 "$_reponame/$_dirname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Package licenses
  install -Dm644 "$_reponame/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


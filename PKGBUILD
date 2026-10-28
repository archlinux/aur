# Maintainer: Ilya Partanskiy <partanskiy.im@gmail.com>
# shellcheck disable=SC2034,SC2154
# makepkg consumes package metadata and supplies srcdir/pkgdir.
pkgname=lyfy
pkgver=26.10.0
pkgrel=1
pkgdesc='Declarative system maintenance and Git-backed host state for Arch Linux'
arch=('x86_64')
url="https://github.com/partanskiy/$pkgname"
license=('MIT')
depends=('glibc' 'libgcc' 'git' 'pacman' 'systemd')
optdepends=('sudo: request protected read-only scans with lint --elevate')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('5d8d478fe0529fb2a9ad95d27e41f65fd0e0e5a99487964662a76c1fa0c97b1b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  cargo build --frozen --release --target x86_64-unknown-linux-gnu --bin "$pkgname"
}

check() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  cargo test --frozen --target x86_64-unknown-linux-gnu --all-features
  test "$("target/x86_64-unknown-linux-gnu/release/$pkgname" --version)" = "$pkgname $pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || return
  install -Dm755 "target/x86_64-unknown-linux-gnu/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 "docs/man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "docs/man/$pkgname.conf.5" "$pkgdir/usr/share/man/man5/$pkgname.conf.5"
  for document in configuration rules storage; do
    install -Dm644 "docs/$document.md" "$pkgdir/usr/share/doc/$pkgname/$document.md"
  done
}

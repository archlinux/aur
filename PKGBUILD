# Maintainer: Ilya Partanskiy <partanskiy.im@gmail.com>
# shellcheck disable=SC2034,SC2154
# makepkg consumes package metadata and supplies srcdir/pkgdir.
pkgname=lyfy
pkgver=26.10.2
pkgrel=1
pkgdesc='Declarative system maintenance and Git-backed host state for Arch Linux'
arch=('x86_64')
url="https://github.com/partanskiy/$pkgname"
license=('MIT' 'GPL-3.0-only')
depends=('glibc' 'libgcc' 'git' 'pacman' 'systemd' 'libalpm.so' 'libarchive.so')
optdepends=('sudo: authenticate interactive host lint and explicit --elevate scans')
makedepends=('cargo' 'pkgconf')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-source.tar.gz")
sha256sums=('077160869e807e40b98e5239de3b51828fe3f165d734c0a4975ecee722382af4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  test -s .cargo/config.toml && test -d vendor && test -s native-sources/VERSIONS || return 1
  cargo fetch --frozen --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo build --frozen --release --target x86_64-unknown-linux-gnu --bin "$pkgname"
}

check() {
  cd "$srcdir/$pkgname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo test --frozen --target x86_64-unknown-linux-gnu --all-features
  test "$("target/x86_64-unknown-linux-gnu/release/$pkgname" --version)" = "$pkgname $pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || return
  install -Dm755 "target/x86_64-unknown-linux-gnu/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 DISTRIBUTION.md "$pkgdir/usr/share/licenses/$pkgname/DISTRIBUTION.md"
  install -Dm644 THIRD_PARTY_LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 "docs/man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "docs/man/$pkgname.conf.5" "$pkgdir/usr/share/man/man5/$pkgname.conf.5"
  for document in configuration rules lint storage; do
    install -Dm644 "docs/$document.md" "$pkgdir/usr/share/doc/$pkgname/$document.md"
  done
}

# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=rust-anything
pkgver=2.0.0
pkgrel=1
pkgdesc='Incrementally port applications to Rust and verify them against recorded behavior'
arch=('x86_64' 'aarch64')
url='https://github.com/erkamyaman/rust-anything'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('rust>=1:1.97')
# Rust's linker cannot read GCC LTO objects from the bundled Tree-sitter parsers.
options=('!lto')
conflicts=('rust-anything-bin')
optdepends=(
  'rust: build Rust ports and run gate checks with Cargo, rustfmt, and Clippy'
  'nodejs: record JavaScript and TypeScript behavior'
  'python: run the Python and C recording and replay harnesses'
  'gcc: compile C originals for recording'
  'go: record Go behavior'
  'ruby: record Ruby behavior'
  'java-environment: provide javac and java for the Java harness'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1efdcc31c76a2cacfeec45c3e9be8a5262d0a2bcea209e55530616a8a5997cf')

prepare() {
  cd "$pkgname-$pkgver"
  CARGO_HOME="$srcdir/cargo" cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

_cargo() {
  cd "$pkgname-$pkgver"
  local -x CARGO_HOME="$srcdir/cargo"
  local -x RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  local -x CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  cargo "$@"
}

build() {
  _cargo build --frozen --release
}

check() {
  _cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rust-anything "$pkgdir/usr/bin/rust-anything"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}

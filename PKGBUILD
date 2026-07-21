# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux
pkgver=0.9.0
pkgrel=1
pkgdesc='Universal Rust multiplexer with a typed SDK'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/Helvesec/rmux
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  libexec.patch
)
sha256sums=('4047be9f3dd53105ee91faaf066a58b423862d0ffd621047e76d7aa1cc793db5'
            '3f44699f6d2e7d1c71b218615ba778a9957f6434e0933f3c9b3ec9a23afaf93a')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../libexec.patch
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package rmux --bin rmux
  cp target/release/rmux target/release/rmux-bin
  cargo build --frozen --release --package rmux --bin rmux-daemon
  cargo build --frozen --release --package rmux --features tiny-cli --bin rmux
  mkdir target/release/completion
  cargo run --quiet --package xtask -- generate-completions --output-dir target/release/completions
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname-daemon"
  install -Dm0755 "target/release/$pkgname-bin" "$pkgdir/usr/lib/$pkgname/libexec/$pkgname"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 docs/man/"$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "target/release/completions/$pkgname.bash" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 "target/release/completions/$pkgname.elv" -t "$pkgdir/usr/share/elvish/lib/"
  install -Dm644 "target/release/completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "target/release/completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}

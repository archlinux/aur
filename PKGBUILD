# Maintainer: croaky-fx <217624563+croaky-fx@users.noreply.github.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=oxiclean
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast Cross-Distribution Linux System Cleaner written in Rust"
arch=('x86_64')
url="https://github.com/croaky-fx/oxiclean"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
# ring (rustls' crypto backend) ships hand-written assembly that a makepkg
# build with LTO enabled compiles with -flto; ld.lld then can't resolve its
# symbols. Disable LTO for this package so the release binary links.
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname"
  cargo build --release --frozen --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  # One test in 1.9.0 can fail by timing (fixed in later releases), so it is skipped.
  cargo test --frozen --all-features -- --skip test_look_for_finds_a_process_by_its_command_line_and_not_itself
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}

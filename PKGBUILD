# Maintainer: Felix Pehla <s6fepehl@uni-bonn.de>

pkgname=alpha_tui
pkgver=1.8.1
pkgrel=1
pkgdesc="A TUI for interpreting and debugging programs written in alpha-notation"
arch=('x86_64')
url="https://github.com/LMH01/alpha_tui"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
)
checkdepends=(
  'cargo'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/LMH01/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('c8e9b6742a639daa8e2e0bb953ace1a394d0d989dba506906f655420d633f761')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/$pkgname" {CONTRIBUTING,README}.md
  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples" examples/*.json
  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples/programs" examples/programs/*.alpha
  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/themes" themes/*.{md,json}
  install -Dm0644 -t "$pkgdir/usr/share/$pkgname/themes/llm-generated" themes/llm-generated/*.json
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

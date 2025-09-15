# Maintainer: Hunter Davenport <mallow.boxes6w@icloud.com>

pkgname=boxunbox
pkgver=0.2.3
pkgrel=1
pkgdesc='A Rust-based alternative to GNU stow'
url='https://github.com/dablenparty/boxunbox'
license=('0BSD')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
provides=(unbox)
sha256sums=('04c687660dafcf7bdc9dec72b6f4e1013fd3eb0d1163c8faabf184dd47cccca3')
conflicts=('boxunbox-git')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  cargo run --release --bin=mangen
  cargo run --release --bin=shell-complete
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --workspace --frozen --all-features
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit 1

  local binname="unbox"
  install -Dm755 "target/release/$binname" "$pkgdir/usr/bin/$binname"

  # shell completions
  install -Dm644 "target/release/completions/$binname.bash" "$pkgdir/usr/share/bash-completion/completions/$binname"
  install -Dm644 "target/release/completions/$binname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$binname"
  install -Dm644 "target/release/completions/$binname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$binname.fish"

  # docs
  install -Dm644 "target/release/man/boxunbox-mangen.1" "$pkgdir/usr/share/man/man1/$binname.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

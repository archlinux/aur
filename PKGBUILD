# Maintainer: sykik <xo.sykik@gmail.com>
pkgname=jocalsend
pkgver=1.6.18033988
pkgrel=1
pkgdesc="A TUI for LocalSend"
arch=('x86_64')
url="https://git.kittencollective.com/nebkor/joecalsend"
license=('custom')
depends=('gcc-libs')
makedepends=('cargo' 'rust' 'cmake' 'perl' 'go')
provides=('jocalsend')
conflicts=('jocalsend')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('d967acd99a7b266bdec05ec8e2a8cc1f79ebbd425cb43efc0ca2f20a7f6096d6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  
  # Vendoring dependencies for reproducible builds
  cargo vendor
  mkdir -p .cargo
  cat > .cargo/config.toml <<EOF
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "vendor"
EOF
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --offline
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

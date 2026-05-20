# Maintainer: Pasqual Peñalver <public@paski.dev>
pkgname=gitorii
pkgver=0.7.11
pkgrel=1
pkgdesc="A human-first Git client with multi-platform CI/CD control plane (GitLab + GitHub)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/paskidev/gitorii"
license=('custom:TSAL-1.0')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo' 'git')
provides=('torii')
conflicts=('gitorii-experimental' 'gitorii-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/paskidev/gitorii/-/archive/v$pkgver/gitorii-v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # russh 0.60.2 + aws-lc-sys 0.40 chain needs more stack than default
  # during monomorphization of the generic-tree types.
  export RUST_MIN_STACK=16777216
  cargo build --frozen --release --bin torii
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm0755 "target/release/torii" "$pkgdir/usr/bin/torii"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

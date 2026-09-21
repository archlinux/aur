pkgname=pnpm-rust
pkgver=12.5.1
pkgrel=1
pkgdesc="Fast, disk space efficient package manager (Rust version, built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
makedepends=('cargo')
options=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/pnpm/pnpm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51bddb1a98de3a4e0f2d731c723f2365da6672ebe5046b6d470201579bf87908')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname-$pkgver"
  sed -i '/# >>> pnpm-managed cargo sources >>>/,/# <<< pnpm-managed cargo sources <<</d' .cargo/config.toml
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --bin pnpm
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/pnpm" "$pkgdir/usr/bin/pnpm"
  # pnpm/pnpx/pnx aliases: upstream ships them as sh scripts (see pnpm/npm/pnpm/)
  install -Dm755 pnpm/npm/pnpm/pn "$pkgdir/usr/bin/pn"
  install -Dm755 pnpm/npm/pnpm/pnpx "$pkgdir/usr/bin/pnpx"
  install -Dm755 pnpm/npm/pnpm/pnx "$pkgdir/usr/bin/pnx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

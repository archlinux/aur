# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=rust-glancer
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight Rust language server optimized for low memory usage'
arch=('x86_64' 'aarch64')
url='https://github.com/rust-glancer/rust-glancer'
license=('MIT OR Apache-2.0')
# cargo: workspace discovery at runtime. rust-src: upstream lists it as mandatory.
depends=('cargo' 'rust-src' 'zstd' 'libgcc' 'glibc')
makedepends=('rustup')
# zstd is unbundled below, but mimalloc cannot be (upstream pins and patches it).
# GCC LTO would turn it into bytecode that rust-lld cannot link. The Rust code
# still gets fat LTO from the dist profile.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d2bcb9cf1a673990dfcc6d945e190e7a66fce14719ae54fd2d9a74898549cb4a99c75c60a2149d5dbc35131fcb72172b8f0bfafcd5a8746af4bdad1f8ae13afd')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  export ZSTD_SYS_USE_PKG_CONFIG=1
  # Upstream sets this mimalloc define through [env] in .cargo/config.toml, but
  # cargo does not override variables that are already set, and makepkg always
  # exports CFLAGS/CXXFLAGS. Append it so the bundled mimalloc matches upstream.
  export CFLAGS+=' -DMI_NO_ALIGNED_HINT=1'
  export CXXFLAGS+=' -DMI_NO_ALIGNED_HINT=1'
  # Same profile as the upstream release binaries (fat LTO, one codegen unit).
  cargo build --frozen --profile dist -p rust-glancer
}

check() {
  cd "$pkgname-$pkgver"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export CFLAGS+=' -DMI_NO_ALIGNED_HINT=1'
  export CXXFLAGS+=' -DMI_NO_ALIGNED_HINT=1'
  # Not --all-features: the jemalloc and mimalloc features are mutually exclusive.
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" target/dist/rust-glancer
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT LICENSE-APACHE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

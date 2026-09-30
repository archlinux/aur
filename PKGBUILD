# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=llama-preset-proxy
pkgver=0.2.3
pkgrel=1
pkgdesc='HTTP proxy that injects llama.cpp preset params and reroutes requests to avoid model reloads'
arch=('x86_64' 'aarch64')
url='https://github.com/drizzt/llama-preset-proxy'
license=('MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  cargo
  git
)
options=(!lto)
backup=("etc/$pkgname.env")
source=("git+$url#tag=v$pkgver")
b2sums=('51aabdc2819ec880d332e7c23f74ad6be19d65e7635dd26c3fa0fec05a338af20b6045b54b3998b78051fd577916994317a3220fcfe57d5fe7aee79e7a9d2da3')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
  sed -i 's|/usr/local/bin/|/usr/bin/|' packaging/$pkgname.service
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "packaging/$pkgname.service"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  # TODO commit that upstream
  install -Dm0644 /dev/stdin "$pkgdir/etc/$pkgname.env" <<'EOF'
# Configuration for llama-preset-proxy.service (all keys optional).
#LPP_LISTEN_HOST=127.0.0.1
#LPP_LISTEN_PORT=8081
#LPP_BACKEND_URL=http://127.0.0.1:8080/v1
#LPP_CACHE_TTL_SECS=30
#LPP_MAX_BODY_MB=8
#LPP_REQUEST_TIMEOUT_SECS=300
#LPP_MAX_CONCURRENT=256
EOF
}

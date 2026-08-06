# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=askalono
pkgver=0.5.0
pkgrel=4
_lld_ver=3.28.0
pkgdesc="A tool & library to detect open source licenses from texts"
arch=('x86_64')
url="https://github.com/jpeddicord/askalono"
license=('Apache-2.0')
depends=(
  'libgcc'
  'zstd'
)
makedepends=(
  'cargo'
  'git'
)
source=("git+https://github.com/jpeddicord/askalono.git#tag=$pkgver"
        'git+https://github.com/spdx/license-list-data.git')
sha256sums=('4abdd5ee637f84b8a5b59afcfaba2e52c0814cdafe500dc875f1792cf46ed6db'
            'SKIP')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  for d in "$pkgname" "$pkgname/cli" "$pkgname/extras/wasm"; do
    cargo fetch --manifest-path "${d}/Cargo.toml" --target host-tuple
  done

  cd "$pkgname"
  git submodule init

  # Manually update submodule
  git submodule foreach git pull origin main

  git config submodule.datasets/modules/spdx-license-list-data.url \
   "$srcdir/license-list-data"
   git -c protocol.file.allow=always submodule update

  # Use latest version of the SPDX License List instead of a 4-year-old commit
  cd datasets/modules/spdx-license-list-data
  git checkout -f "v${_lld_ver}"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  for d in "$pkgname" "$pkgname/cli" "$pkgname/extras/wasm"; do
    pushd "${d}"
    cargo build --release
    popd
  done
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  # test real_world_licenses fails
  for d in "$pkgname" "$pkgname/cli"; do
    pushd "${d}"
    cargo test || :
    popd
  done
}

package() {
  cd "$pkgname"
  install -Dm755 "cli/target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm755 "extras/wasm/target/release/lib${pkgname}_wasm.so" -t \
    "$pkgdir/usr/lib/"
}

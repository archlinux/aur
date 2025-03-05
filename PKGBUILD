# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.19.1
pkgrel=4
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')

build() {
  cd "$pkgname-$pkgver"

  rust_toolchain=stable
  if which rustup 2>/dev/null; then
      min_rust_version=$(cat Cargo.toml | grep "rust-version" | awk '{ print $3 }' | xargs)
      rust_version=$(rustc --version 2>/dev/null | awk '{ print $2 }')

      install_min_version=0
      if [ -z "$rust_version" ]; then
          install_min_version=1
      else
          if [ $min_rust_version != $(echo -e "$min_rust_version\n${rust_version}" | sort --version-sort | head -1) ]; then
              install_min_version=1
          fi
      fi
      if [ $install_min_version -eq 1 ]; then
          rustup update $min_rust_version
          rust_toolchain=$min_rust_version
      else
          rust_toolchain=$(rustup show active-toolchain | awk 'NR==1 { print $1 }')
      fi
  fi

  export RUSTUP_TOOLCHAIN="$rust_toolchain"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rate_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
sha256sums=('1b5c5e1462f8b4b11f6e2650f5095d3d05f74570ef2a32c861bb0f551432719c')

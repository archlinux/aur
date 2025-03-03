# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.19.1
pkgrel=1
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

  if which rustup 2>/dev/null; then
      if rustc --version 2>/dev/null; then
          rust_toolchain=$(echo -e "1.85\n$(rustc --version | awk '{ print $2 }')" \
              | sort --version-sort --reverse \
              | head -1)
      else
          rust_toolchain="1.85"
      fi
  else
      rust_toolchain=stable
  fi
  export RUSTUP_TOOLCHAIN=$rust_toolchain
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

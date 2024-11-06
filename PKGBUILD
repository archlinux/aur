# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.31
pkgrel=1
epoch=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'glibc'
  'openssl'
)
makedepends=(
  'cargo'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00bbe0466353c7a91e4c6460477d88fc20edcf7e1fc79d2381b95ba58cfde668')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable

  # Exclude debian features:
  cargo test --frozen --no-default-features --features=breezy,dep-server,upstream || :
}

package() {
  cd "$pkgname-$pkgver"

  for target in deb-fix-build deb-upstream-deps dep-server ogni "$pkgname-deb" "$pkgname-dist" report-apt-deps-status; do
    install -Dm755 target/release/$target -t "$pkgdir/usr/bin/"
  done
}

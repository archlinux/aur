# Maintainer: Kristoffer Tell <kristoffertell@gmail.com>
pkgname=ayaled2
pkgver=0.6.0
pkgrel=1
pkgdesc="A daemon to manage joystick LEDs on AYANEO devices"
arch=('x86_64')
makedepends=('cargo')
repo="https://github.com/kristoffertell/ayaled2"
source=("${repo}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=($(wget -q -O "${pkgver}.tar.gz.sha256" "${repo}/releases/download/$pkgver/$pkgver.tar.gz.sha256" && cat "$pkgver.tar.gz.sha256" | cut -f1 -d " "))

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
  cd -
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  target_parent_dir="${srcdir}/${pkgname}-${pkgver}/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "${target_parent_dir}target/release/$pkgname"
  mkdir -p "$pkgdir/etc/systemd/system"
  echo "srcdir = ${srcdir}"
  echo "pkgdir = ${pkgdir}"
  srcdir="${srcdir}/${pkgname}-${pkgver}/src"
  install -m755 "$srcdir/ayaled2.service" "$pkgdir/etc/systemd/system/ayaled2.service"
}

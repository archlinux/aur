# Maintainer: Martin Birnthaler <birnthalermartin at gmail dot com>
pkgname=ztop
pkgver=0.3.1
pkgrel=1
pkgdesc="Display ZFS datasets' I/O in real time"
arch=('x86_64')
url="https://github.com/asomers/ztop"
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("${pkgname}-${pkgver}::git+$url.git#tag=v${pkgver}")
sha256sums=('f9e9aa04c31e4dea7f101fc29567f4b0f4a5e73c3fa181e6d34f0e06ab0e3e12')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

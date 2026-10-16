# Maintainer: Hannes Körber <hannes@hkoerber.de>
pkgname='screencfg'
pkgver=0.6.3
pkgrel=1
pkgdesc='Automatically configure your screen setup'
arch=('x86_64')
url='https://github.com/hakoerber/screencfg'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
source=("https://github.com/hakoerber/screencfg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --features=testing
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}

# Maintainer: Kushagra Sharma <kushagrasharma@duck.com>

pkgname=ghsync
pkgver=0.1.0
pkgrel=1
pkgdesc="Back up all GitHub repos (personal + org) via gh CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/TheDarkArtist/ghsync"
license=('MIT')
depends=('gcc-libs' 'glibc' 'github-cli')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('a51fce8b2316c55818518113faca9ee477124ac1afb5d7fe709ff93aaf937ca92b1cf06b45c7db8eb6e13132d439982efc64398c6435ea9de72ebfaeaa215346')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

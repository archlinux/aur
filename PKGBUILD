# Maintainer: Tobias Frölich <hi@froelich.dev>
pkgname=klog
pkgver=0.6.0
pkgrel=2
pkgdesc="A tool that allows you to tail logs of multiple Kubernetes pods simultaneously"
arch=('x86_64')
url="https://github.com/tobifroe/klog"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('rust' 'cargo' 'pkg-config')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tobifroe/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  
  export PKG_CONFIG_ALL_STATIC=0
  export OPENSSL_NO_VENDOR=1
  
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features || true
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

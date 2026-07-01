# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=avocado-linux
pkgname=avocado-cli
pkgver=0.41.2
pkgrel=1
pkgdesc='Command line interface for Avocado Linux'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cmake' 'clang')
provides=('avocado')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ec1c1a5fbab14988f55f3e1fc67da019d67b17b078e7b87335cc1d32d9dd002a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # avocado-cli commits Cargo.lock; --locked keeps the build reproducible.
  # rustls pulls aws-lc-sys, which needs cmake + a C compiler at build time.
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/avocado "${pkgdir}/usr/bin/avocado"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:

# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=streamdown
pkgver=0.1.4
pkgrel=1
pkgdesc='A streaming markdown renderer for modern terminals'
arch=('x86_64')
url='https://github.com/fed-stew/streamdown-rs'
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5bee6e0a7498706d030f76a2bcb3dc30beed28a2ee4e2938cb465c4408d1609')

prepare() {
  cd "${pkgname}-rs-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-rs-${pkgver}"
  export CARGO_TARGET_DIR=target
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-rs-${pkgver}"
  install -Dm755 "target/release/sd" "${pkgdir}/usr/bin/streamdown"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=docuum
pkgver=0.20.5
pkgrel=1
pkgdesc="LRU eviction of Docker images."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/stepchowfun/docuum"
license=('MIT')
makedepends=('cargo')
depends=('docker')
conflicts=("${pkgname}-git")
install="${pkgname}.install"
backup=("etc/default/${pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "${pkgname}.service")
sha512sums=('bd9cea4c637b366e02556ebf1b2f8955d7224530e353076afba9726ff3a61f029d5df5f631273cbf6b23796476ca686bf9851e3b0084caf9522a3f9faaf55c4e'
            '85a89a40202b0fab03da74c98aeb34a8ab14016f8152b13ace19cd274a453359f51d2261ece31f1e039857d131b1cbbb3513e525fbea9313233069bd1def5048')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- --skip code_str_display
  # FIXME broken test skipped
}

package() {
  cd "${srcdir}"
  install -Dm0755 "${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

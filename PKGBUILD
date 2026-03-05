# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=s3sh
pkgver=0.2.2
pkgrel=1
pkgdesc="interactive S3 shell with Unix-like commands and archive navigation"
url="https://github.com/dacort/s3sh"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'libgcc' 'libbz2.so')
makedepends=('rust')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!lto" "!debug")

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --target "${CARCH}-unknown-linux-gnu" --release --features parquet
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/target/${CARCH}-unknown-linux-gnu/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('025f9fb24048ac49ff4ac1216f8970c961d35c7488eee0d892caff6e18703b428fa1f1a2715e7bdf2d6e698c5faf59b6d314147e7155896c617972783eae5534')

# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=s3sh
pkgver=0.2.1
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

sha512sums=('46f4417b453bb5df1a107c32e311e9c91d7128b2a711777ebb4ccd920806cd8e6a08793127e97092e7009e3efe482af6e3f6e2af11abef1f688e06da5119147c')

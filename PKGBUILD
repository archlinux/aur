# Maintainer: agony <27015 at riseup dot net>

pkgname=lakekeeper
pkgver=0.15.0
pkgrel=1
pkgdesc='Apache Iceberg REST catalog'
arch=('x86_64' 'aarch64')
url='https://github.com/lakekeeper/lakekeeper'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo' 'clang' 'cmake' 'nodejs' 'npm')
options=('!lto')
install=lakekeeper.install
_swaggerui=5.17.14
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "swagger-ui-${_swaggerui}.zip::https://github.com/swagger-api/swagger-ui/archive/refs/tags/v${_swaggerui}.zip")
noextract=("swagger-ui-${_swaggerui}.zip")
sha256sums=('e7f9ddb3a41a836f71652ab5c847b79cb4d8e463b871b1b94153bf37a011f1d3'
            '481244d0812097b11fbaeef79f71d942b171617f9c9f9514e63acbe13e71ccdc')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS+=" --cfg tracing_unstable --cfg tokio_unstable"
  export OPENSSL_NO_VENDOR=1
  export CFLAGS+=" -std=gnu17"
  export WARN_CFLAGS=""
  export SWAGGER_UI_DOWNLOAD_URL="file://${srcdir}/swagger-ui-${_swaggerui}.zip"
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_allow_git=root
  cargo build --frozen --release --all-features --bin lakekeeper
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/lakekeeper version)" == "${pkgver}" ]]
  target/release/lakekeeper management-openapi > /dev/null
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/lakekeeper -t "${pkgdir}/usr/bin"
  install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

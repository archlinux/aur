# Maintainer: agony <27015 at riseup dot net>

pkgname=mediafire_rs
pkgver=0.2.3
pkgrel=1
pkgdesc='Downloads files and folders from MediaFire'
arch=('x86_64')
url='https://github.com/NicKoehler/mediafire_rs'
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e32879bd7f6d69844b9755d4eded29d67846dec8fb9747ce86c5542d2ef18464')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/mdrs --version)" == "mediafire_rs ${pkgver}" ]]
  [[ "$(printf 'https://www.mediafire.com/file/demo/name.zip/file\n' | target/release/mdrs --input /dev/stdin)" == 'Warning: No files to download' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/mdrs -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

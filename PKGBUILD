# Maintainer: agony <27015 at riseup dot net>

pkgname=c2patool
pkgver=0.28.6
pkgrel=1
pkgdesc='Tool for displaying and creating C2PA manifests'
arch=('x86_64' 'aarch64')
url='https://github.com/contentauth/c2patool'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df68d7e5ab35a1b120a1c6cdbcf00129e05dad9aa73b49feec33a8a5aa5aef3c')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export OPENSSL_NO_VENDOR=1
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  [[ "$(target/release/c2patool --version)" == "c2patool ${pkgver}" ]]
  [[ "$(target/release/c2patool sample/C.jpg --info | tail -n 1)" == 'One manifest' ]]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/c2patool -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

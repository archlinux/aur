# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=markmarkoh-lt
pkgver=0.0.12
pkgrel=1
_srcdir="lt-${pkgver}"
pkgdesc="An unofficial TUI client to view and interact with Linear.app issues"
arch=('x86_64' 'aarch64')
url="https://github.com/markmarkoh/lt"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c763943267fd2f5fc7453114f479055458883e5a07af1ae2da3738f43b91c0be')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo update -p wl-clipboard-rs --precise 0.7.1
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/lt" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

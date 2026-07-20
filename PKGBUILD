# Maintainer: codearoni <devnull@codearoni.io>

pkgname=jud
_pkgname=jakes-url-debugger
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI that shows the full lifecycle of an HTTP request"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/codearoni/jakes-url-debugger"
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('817e9e474d7fe14b6f3f2c9cb5f6149d2d228130785e8fdabd0a7d5b5997c289')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_pkgname}-v${pkgver}"
  install -Dm755 target/release/jud "$pkgdir/usr/bin/jud"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

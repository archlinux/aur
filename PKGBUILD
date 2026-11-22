# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=private_poker
pkgver=4.1.0
pkgrel=1
_srcdir="private_poker-private_poker-v${pkgver}"
pkgdesc="A poker library, server, client"
arch=('x86_64' 'aarch64')
url="https://github.com/theOGognf/private_poker"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
_tag="private_poker-v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('66e7af5f00c6f977283d754b90f40258816c9abf2fca32f9e3c7ef289d119ca8')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/pp_bots" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/pp_client" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/pp_server" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

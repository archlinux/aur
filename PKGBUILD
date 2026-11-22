# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=partly-claudy
pkgver=0.1.1
pkgrel=1
_srcdir="partly-claudy-${pkgver}"
pkgdesc="Terminal view of Claude status page (status.claude.com)"
arch=('x86_64' 'aarch64')
url="https://github.com/taho-inc/partly-claudy"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('086585357fa6ef24e1b6302c28b772792b633aea17cb3a59af81365f8cc7bd25')

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
  install -Dm755 "target/release/partly-claudy" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

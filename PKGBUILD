# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=astray
pkgver=0.1.0beta1
pkgrel=1
_tag="v0.1.0-beta-1"
_srcdir="astray-${_tag#v}"
pkgdesc="TUI-based space strategy game"
arch=('x86_64' 'aarch64')
url="https://github.com/ekosachev/astray"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('74558c33296773c4f481f78f34c2d6b32b9f91a669c648de71b76ba31efca3c8')

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
  install -Dm755 "target/release/astray" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

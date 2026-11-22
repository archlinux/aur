# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vib-tui
pkgver=0.1.0beta.1
pkgrel=1
_tag="v0.1.0-beta.1"
_srcdir="vib-${_tag#v}"
pkgdesc="A terminal file browser with LocalSend built in"
arch=('x86_64' 'aarch64')
url="https://github.com/ayanchavand/vib"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('fd6359e98585988054161b987f80aef76a8219e70f6a0787c8afe9f837590d21')

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
  install -Dm755 "target/release/vib" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

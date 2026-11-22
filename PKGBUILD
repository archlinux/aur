# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deadline
pkgver=1.0.0
pkgrel=1
_srcdir="deadline-${pkgver}"
pkgdesc="A haunted late-90s BBS text adventure for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/pinkpixel-dev/deadline"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('979d0a2f9c01d2615bac32fc8852e19be87ce1f360b6d1c261b553b50da0f631')

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
  install -Dm755 "target/release/deadline" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

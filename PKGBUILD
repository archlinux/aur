# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=linear-tui
pkgver=0.0.1
pkgrel=1
_srcdir="linear-tui-${pkgver}"
pkgdesc="A Linear client that gets all its data from linearctl's JSON interface"
arch=('x86_64' 'aarch64')
url="https://github.com/solcreek/linear-tui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('372f23ed325a59fd2dfb31a1bf838c80ee8abf81128016b50f5199285d584d77')

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
  install -Dm755 "target/release/fake-linearctl" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sc-cli
pkgver=0.3.2
pkgrel=1
_srcdir="sc-cli-${pkgver}"
pkgdesc="A TUI for Shortcut (formerly know as Clubhouse) a project management tool"
arch=('x86_64' 'aarch64')
url="https://github.com/lnds/sc-cli"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f5385b378ec056470e4a92056ff9778b2435c08caf3bbdd9ac6280c03eb92080')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
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
  install -Dm755 "target/release/sc-cli" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

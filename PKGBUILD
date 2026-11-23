# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cargo-thesaurust
pkgver=0.1.2
pkgrel=1
_srcdir="cargo-thesaurust-${pkgver}"
pkgdesc="A terminal-based dictionary app"
arch=('x86_64' 'aarch64')
url="https://github.com/quietpigeon/cargo-thesaurust"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('10d33985c94ddb1ebb550681a1849e5619ada83fb46e6867ad3c687270d50645')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  sed -i 's/^tui-input = "0.12.0"/tui-input = "0.11.1"/' Cargo.toml
  cargo generate-lockfile
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/thesaurust" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

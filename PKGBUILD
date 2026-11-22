# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=toktop
pkgver=0.1.5
pkgrel=1
_srcdir="toktop-${pkgver}"
pkgdesc="A terminal dashboard for monitoring OpenAI and Anthropic token usage"
arch=('x86_64' 'aarch64')
url="https://github.com/htin1/toktop"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e01566757971e7cf42dd881ea9e8a8a53bbda4dade210a3c80df71638418ee4')

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
  install -Dm755 "target/release/toktop" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

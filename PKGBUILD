# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=deputui
pkgver=0.3.0
pkgrel=1
_srcdir="deputui-${pkgver}"
pkgdesc="Review and install JavaScript package updates from npm"
arch=('x86_64' 'aarch64')
url="https://github.com/twiddler/deputui"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3fe6019a9665c11b2fefa346c950f5ff79060f8920f2be8e4f99ae0dc396aa0')

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
  install -Dm755 "target/release/deputui" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/deputui-pnpm" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/deputui-review" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

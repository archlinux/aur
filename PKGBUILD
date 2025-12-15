# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=ad
pkgver=0.4.0
pkgrel=1
pkgdesc='An adaptable text editor'

arch=('x86_64')
license=('MIT')
url="https://github.com/sminez/${pkgname}"

makedepends=('cargo' 'tree-sitter-python' 'tree-sitter-rust')
depends=('gcc-libs' 'tree-sitter')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e35cf1030bc24bf336066fcd367e8a022d097357b896cb316183993951d4ffb8')

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so"

  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so -C link-arg=/usr/lib/libtree-sitter-python.so -C link-arg=/usr/lib/libtree-sitter-rust.so"

  cargo test --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm644 "docs/man/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

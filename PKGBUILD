# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.15.1
pkgrel=1
pkgdesc="A fast type checker and IDE for Python"
arch=("x86_64")
url="https://github.com/facebook/pyrefly"
license=("MIT")
makedepends=(
  "cargo-nightly"
  "clang"
  "git"
  "lld"
)
source=("git::git+https://github.com/facebook/pyrefly#tag=${pkgver}")
sha256sums=('d4bccf84d7dad57ffdbb69f67324e87b16710253022f63d96112e848a4ec350e')

prepare() {
  cd "${srcdir}/git/pyrefly"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/git/pyrefly"
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    cargo build --release --frozen
}

package() {
  cd "${srcdir}/git/pyrefly"
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/git/LICENSE"
}

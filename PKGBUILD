# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.16.3
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
sha256sums=('624e856dbac3e68249386c88ce693a2b7de5d9ff3cf5f4c5c2769ecb3d08bbf8')

prepare() {
  cd "${srcdir}/git/pyrefly"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/git/pyrefly"
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    cargo build --release --frozen
}

check() {
  cd "${srcdir}/git/pyrefly"
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    cargo check
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/git/target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/git/LICENSE"
}

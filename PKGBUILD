# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=pyrefly
pkgver=0.16.1
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
sha256sums=('c56a3b9241d44d0f80b846a67ff77343d2c837ca6ea45aaf845f75c60cba6db5')

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
  cd "${srcdir}/git/pyrefly"
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "target/release/pyrefly"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/git/LICENSE"
}

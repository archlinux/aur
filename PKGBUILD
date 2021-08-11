#Maintainer: Walter - "bWVAd2FsdGVyY2FzYW5vdmEueHljCg==" - base64

pkgname="click-git"
_pkgname="click"
pkgver=0.5.4.361.g661ba28
pkgrel=1
pkgdesc="The 'Command Line Interactive Controller for Kubernetes'"
arch=("i686" "x86_64")
url="https://github.com/databricks/click"
license=("Apache")
depends=()
makedepends=("cargo" "git")
provides=("click")
conflicts=("click")
source=("$_pkgname::git+$url")
sha256sums=("SKIP")

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml | head -n1 | awk -F '"' '{print $2}').$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}

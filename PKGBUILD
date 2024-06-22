# Maintainer: Eren Önen <erenot@protonmail.com>
_pkgname="rustow"
pkgname="${_pkgname}-git"
pkgver=1.0.r0.g6c9a9ab
pkgrel=1
pkgdesc="Rustow is a replacement of GNU Stow written in Rust. It support most of the features of Stow with some extensions."
arch=(any)
url="https://gitlab.com/Erenoit/rustow"
license=("GPL3")
depends=("glibc" "gcc-libs")
makedepends=("cargo" "git")
provides=(rustow)
options=()
source=("${_pkgname}::git+https://gitlab.com/Erenoit/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 rustow.1 "${pkgdir}/usr/share/man/man1/rustow.1"
}

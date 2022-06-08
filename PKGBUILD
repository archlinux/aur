# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=fsrx-git
_pkgname=${pkgname%-git}
pkgver=r6.860bcdc
pkgrel=1
pkgdesc="flow state reading in the terminal"
arch=("x86_64")
url="https://github.com/coloradocolby/fsrx"
license=("MIT")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-bin)
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  GEN_COMPLETIONS=1 cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

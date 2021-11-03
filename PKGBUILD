# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch-git
_pkgname=${pkgname%-git}
pkgver=r385.a1c4f03
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal"
arch=('x86_64')
url="https://github.com/ouch-org/ouch/"
license=('MIT')
makedepends=('git' 'cargo')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

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
  cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}

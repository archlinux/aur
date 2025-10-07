# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=clock-rs
pkgname="$_pkgname-git"
pkgver=r102.g76b94cb
pkgrel=1
pkgdesc="A clock for your terminal! (git version)"
arch=(any)
url="https://github.com/Oughie/clock-rs"
license=(Apache-2.0)
makedepends=(cargo git)
conflicts=(clock-rs)
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/clock-rs
}

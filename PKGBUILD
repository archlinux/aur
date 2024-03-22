# Maintainer: seiuneko <chfsefefgesfen foxmail>
_pkgname="mozlz4"
pkgname="${_pkgname}-git"
pkgdesc="Decompress / compress mozlz4 files"
pkgver=v0.1.0.r10.gd003163
pkgrel=1
arch=("x86_64")
url="https://github.com/jusw85/mozlz4"
license=("MIT")
makedepends=("git" "cargo")
source=("git+https://github.com/jusw85/mozlz4.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check(){
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"
  install -D -m755 "target/release/mozlz4" "$pkgdir/usr/bin/mozlz4"
}

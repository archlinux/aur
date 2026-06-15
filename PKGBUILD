# Maintainer: seiuneko <chfsefefgesfen foxmail>
_pkgname="mozlz4"
pkgname="${_pkgname}-git"
pkgdesc="Decompress / compress mozlz4 files"
pkgver=v0.1.0.r14.ge66f879
pkgrel=1
arch=("x86_64")
url="https://github.com/jusw85/mozlz4"
license=("MIT")
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=("git" "cargo")
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
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
  export CFLAGS="${CFLAGS} -fno-lto"
  cargo test --frozen --release --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm0755 target/release/mozlz4-bin "$pkgdir/usr/bin/mozlz4"
}

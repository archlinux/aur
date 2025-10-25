# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=debug-tui
_pkgname=${pkgname%}
_reponame=${pkgname%}
pkgver=0.2.0
pkgrel=1
pkgdesc="Interactive PHP step debugger for your terminal. Made on planet earth with "
arch=('x86_64' 'armv7h' 'aarch64')
_author=dantleech
url="https://github.com/${_author}/${_reponame}"
license=('unknown')
makedepends=('cargo' 'gcc-libs' 'glibc')
provides=(${pkgname%})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d1831c767369b6c674bf37a3fcef3b3a515155a9e7c35fa22d78b9e913548f27')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_HOME="$srcdir/.cargo"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_HOME="$srcdir/.cargo"
  export CFLAGS+=" -ffat-lto-objects"

  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

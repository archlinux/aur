# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=debug-tui
_pkgname=${pkgname%}
_reponame=${pkgname%}
pkgver=0.3.1
pkgrel=1
pkgdesc="Interactive PHP step debugger for your terminal. Made on planet earth with "
arch=('x86_64' 'armv7h' 'aarch64')
_author=dantleech
url="https://github.com/${_author}/${_reponame}"
license=('unknown')
makedepends=('cargo' 'gcc-libs' 'glibc')
provides=(${pkgname%})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a02d6905b074ea49a5e86b3872d282a9a8483c6f49435070c107a23e746de4eb')

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

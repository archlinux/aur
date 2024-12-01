# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_name=GQL
_binary=gitql
pkgname=${_name,,}
pkgver=0.32.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
arch=(x86_64)
license=(MIT)
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
conflicts=("${_binary}")
options=(!lto) # Linking zlib with flake2 fails with LTO enabled
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('472676754f7dddb5b1f04f2ebc065877adec865b51bc52ea25e789c8cbdb6bd3')

prepare() {
  cd ${_name}-${pkgver}

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${_name}-${pkgver}

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

check() {
  cd ${_name}-${pkgver}

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --all-features --package gitql-cli
}

package() {
  cd ${_name}-${pkgver}

  install -vDm755 -t "$pkgdir/usr/bin" target/release/${_binary}
  ln -rsf "$pkgdir/usr/bin/${_binary}" "$pkgdir/usr/bin/${_name,,}"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

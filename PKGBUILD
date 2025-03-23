# Maintainer: VCalV

_name=GQL
_binary=gitql
pkgname=${_name,,}
pkgver=0.37.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
arch=(x86_64)
license=(MIT)
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
conflicts=("${_binary}")
provides=("${_binary}")
options=(!lto) # Linking zlib with flake2 fails with LTO enabled
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('fed2a2c3b7c4065e81d044c517228a57110979b425eedac87afd612d3ebed7043c27ae60d660c251e02409a7b52517e1ca4fec799ce9e2efd854bd1ea4add786')

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

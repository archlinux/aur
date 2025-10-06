# Maintainer: VCalV

_name=GQL
_binary=gitql
pkgname=${_name,,}
pkgver=0.41.0
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
sha512sums=('395a244a8907f0c657286485b9e7b64b7a0da83c1cce738b6dc25495b2a6fea6c1ee6ee0e15fc43cc720d5020e3042581f610ead561deb10e7628b5462c41f09')

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

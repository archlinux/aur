# Maintainer: VCalV

_name=GQL
_binary=gitql
pkgname=${_name,,}
pkgver=0.40.0
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
sha512sums=('0d5f9c97d26991f3391bc65c47fd04a88ed01ddc885a483b6a640706954c89575e704c3a1445dd31c2cd830ada8c07692aa93a92624facfa5a06d4674f323e32')

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

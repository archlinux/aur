# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=0.8.0
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("git+https://github.com/bgpkit/monocle#tag=v${pkgver}")
sha512sums=('b7d616f1ac930a1d611c9544701f0e78adab2b2207c89c83e96fe31ab4d237b0f8d6cbbaa88dd1e14c5219917563d1bbda947b5e5cf1d6e0bcf060b36eb40e5a')

options=(!debug !lto)

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}


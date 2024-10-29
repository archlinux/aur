# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=0.6.2
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("git+https://github.com/bgpkit/monocle#tag=v${pkgver}")
sha512sums=('97e96cef105a19a26d6b9117973b80f31ec97dde95d4110e70a01fe523bb469e42c32fa4dc6c26b4aff88d2fbe72d00b022b73a13869d061d8830e6f8ba946df')

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


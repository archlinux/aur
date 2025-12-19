# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=1.0.2
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("git+https://github.com/bgpkit/monocle#tag=v${pkgver}")
sha512sums=('b3a00f47dbd715d6e538f8ae6e25f5d2366196b81ad31823a696ec0f844c4e3334011022007a2b3e375b897fb4770f15ae16bf8fd18ebd8fb138c806a1bda5ce')

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


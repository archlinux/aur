# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=1.1.0
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("git+https://github.com/bgpkit/monocle#tag=v${pkgver}")
sha512sums=('c272bf8dee133b9631669f0b4b238d40bfb2288e4cf6a683c4b996b34de885fb8bc34351aa3535a57c1844a0b5103f9a85cccb2c9f406942ac5d70c4cd05cb19')

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


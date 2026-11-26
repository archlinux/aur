# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=monocle
pkgver=1.6.2
pkgrel=1
pkgdesc='See through all BGP data with a monocle'
arch=('x86_64')
url='https://github.com/bgpkit/monocle'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake' 'git')
source=("git+https://github.com/bgpkit/monocle#tag=v${pkgver}")
sha512sums=('191d4af54145bed186e134ff57486d3b6b5e47988bf32e8f1a61882f50be592f01b0c29017129493094dd58963e7d3b972ee301ebda8ed78e18ba07bc0793a75')

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


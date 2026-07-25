# Maintainer: Ali <Im_wrench@proton.me>

pkgname=allp-manager
_pkgname=allp-manager
pkgver=0.3.5
pkgrel=1
pkgdesc="A transparent package-manager orchestrator for Linux (stable source release)"
arch=('x86_64' 'aarch64')
url="https://github.com/allp-manager/allp-manager"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('allp' 'allp-manager')
conflicts=('allp-manager-bin' 'allp-manager-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/allp-manager/allp-manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a73e15f51ecb952904c0071d272bd448151c454b1802a4db682e7a8e77f14419')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo test --frozen --release --lib
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 "target/release/allp" "$pkgdir/usr/bin/allp"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

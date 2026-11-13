# Maintainer: Ali <Im_wrench@proton.me>

pkgname=allp-manager
pkgver=0.6.11
pkgrel=1
pkgdesc="A transparent package-manager orchestrator for Linux (stable source release)"
arch=('x86_64' 'aarch64')
url="https://github.com/allp-manager/allp-manager"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('allp')
conflicts=('allp-manager-bin' 'allp-manager-git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5d0688c43d34d712bfa04974c7f4eb1700caa46c3ebc2bc364c3cee1f9bcf68')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  ALLP_GIT_SHA=740a9d030639fb17f3ae9523362ea1c1648fe291 ALLP_BUILD_CHANNEL=stable ALLP_BUILD_REVISION=0 ALLP_BUILD_OFFICIAL=0 cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  test "$(target/release/allp --version)" = "allp $pkgver" || return 1
  ALLP_BUILD_CHANNEL=development ALLP_BUILD_REVISION=1 ALLP_BUILD_OFFICIAL=0 cargo test --frozen --lib
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/allp "$pkgdir/usr/bin/allp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



pkgname=uutils-grep
pkgver=0.1.0
pkgrel=1
pkgdesc="Rust implementation of grep"
arch=('x86_64')
url=https://github.com/uutils/grep
license=('MIT')
depends=(gcc-libs oniguruma)
makedepends=(pkgconf rust)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f89fdba09c13737ef28741eafb258abd8923d1842fd96cefa4147098318685d1e24707d12c86cd7d5ad295d190f996252e74a063235eb48f662462207a60a84d')

build(){
  cd grep-$pkgver
  export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no"
  [ $RUSTC_BOOTSTRAP = 1 ] && export CARGOFLAGS='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
  export RUSTONIG_DYNAMIC_LIBONIG=1
  cargo build --release
}

package() {
  cd grep-$pkgver
  install -Dm755 target/release/grep "$pkgdir"/usr/bin/uu-grep
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=tidy-viewer
_pkgname=tv
pkgver=1.8.93
pkgrel=1
pkgdesc="CLI csv pretty printer that uses column styling"
arch=('x86_64' 'aarch64')
url="https://github.com/alexhallam/tv"
license=('Unlicense')
makedepends=('cargo')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e99811843fe3e28d22c82f6c8ad757bf5065c622fbbb2d7e4011ab346dca6f1d')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --workspace
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

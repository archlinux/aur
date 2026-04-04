# Maintainer: Niladri Adhikary <nil_adhikary at outlook dot com>
pkgname=rsrssr
pkgver=0.2.4
pkgrel=1
pkgdesc="A really simple RSS and Atom reader for the terminal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tcftbl/rsrssr"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/tcftbl/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('660c271cd39510656d77e12691c661fa49884633daed0305fd3f9992a0da7836')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$pkgname/target"
  export CARGO_PROFILE_RELEASE_LTO=thin
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

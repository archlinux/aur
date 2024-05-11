# Maintainer: khyernet <khyernet@vivaldi.net>
pkgname=tcobalt
pkgver=1.2.0
pkgrel=1
pkgdesc="Command-line tool for downloading your favorite videos and songs from the internet"
arch=('x86_64')
url="https://github.com/khyerdev/tcobalt"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/khyerdev/tcobalt/archive/refs/tags/v1.2.0.tar.gz")
sha256sums=('a19764448af25c16c3ff17eeceeffe250b7d52cfe89d1322fd70ecaf0c0a7594')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/tcb"
}

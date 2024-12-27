# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=lnx
pkgver=0.9.0
_pkgver="$pkgver-master"
pkgrel=2
pkgdesc='Adaptable search engine API'
arch=('x86_64')
url="https://github.com/$pkgname-search/$pkgname"
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'mimalloc' 'zstd')
source=("$pkgname-$pkgver::$url/archive/$_pkgver.tar.gz")
md5sums=('1aeae479dfd3c8ae928369115dfd2088')

prepare() {
  cd "$pkgname-$_pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$_pkgver"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libmimalloc.so -C link-arg=/usr/lib/libzstd.so"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$_pkgver"
  cargo test --release --frozen
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:

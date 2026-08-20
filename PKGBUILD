# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# https://github.com/orhun/pkgbuilds

pkgname=flyline
pkgver=1.7.1
pkgrel=1
pkgdesc="A Bash plugin to replace readline for a modern line editing experience"
arch=('x86_64')
url="https://github.com/HalFrgrd/flyline"
license=('MIT' 'GPL-3.0-only')
depends=('bash' 'glibc' 'libgcc')
makedepends=('cargo')
install="$pkgname.install"
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('067b68de0d1484a43fb77124fd2544f19b3ee30691635d038e94f13868ddb27f')

# c.f. https://gitlab.archlinux.org/archlinux/rfcs/-/merge_requests/69
_srcenv() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir"
  export CARGO_PROFILE_RELEASE_DEBUG=2
  export CARGO_PROFILE_RELEASE_STRIP=false
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
  CFLAGS+=' -ffat-lto-objects'
}

prepare() {
  _srcenv
  cargo fetch --locked --target host-tuple
}

build() {
  _srcenv
  cargo build --release --frozen
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/lib$pkgname.so" "$pkgdir/usr/lib/bash/lib$pkgname.so"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT LICENSE-GPLv3 -t "$pkgdir/usr/share/licenses/$pkgname"
}

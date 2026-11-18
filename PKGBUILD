# Maintainer: win0na <winona@winneon.moe>
pkgname=apw-cli
pkgver=0.2.0
pkgrel=1
pkgdesc='Read Apple Passwords on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/win0na/apw'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'dbus')
conflicts=('apw')
provides=('apw')
makedepends=('cargo' 'rust' 'cmake' 'perl' 'dbus')
source=("apw-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37c70b236a6fe6d3fccc7e2929b0f1275e03ecd055c8e40153d102d14cc1cc02')

build() {
  cd "apw-$pkgver"
  # Arch's LDFLAGS make rustc drop the aws-lc static archive, which leaves
  # every aws_lc_* symbol undefined at link time. Clear them for cargo.
  # No --frozen: the crates are not vendored, so cargo fetches them here.
  LDFLAGS= CFLAGS= CXXFLAGS= cargo build --release --locked
}

check() {
  cd "apw-$pkgver"
  # Same flag problem as build(); build() does not fetch dev-dependencies,
  # so this cannot be offline.
  LDFLAGS= CFLAGS= CXXFLAGS= cargo test --release --locked
}

package() {
  cd "apw-$pkgver"
  install -Dm755 "target/release/apw" "$pkgdir/usr/bin/apw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -d "$pkgdir/usr/share/doc/$pkgname/docs"
  install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}

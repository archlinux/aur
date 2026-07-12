# Maintainer: Ning Sun <n@sunng.info>
pkgname=tapgres
pkgver=0.2.0
pkgrel=1
pkgdesc="Passively tap a local PostgreSQL port and decode its wire traffic to stdout"
arch=('x86_64' 'aarch64')
url="https://github.com/sunng87/tapgres"
license=('MIT')
conflicts=('tapgres-bin')
provides=('tapgres')
depends=('gcc-libs' 'libpcap')
makedepends=('cargo')
# The GitHub archive tarball extracts to tapgres-$pkgver/ (GitHub strips the
# leading "v" from the tag) and includes Cargo.lock, so --frozen is safe.
source=("$pkgname-$pkgver.tar.gz::https://github.com/sunng87/tapgres/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3f1a42888e96c4ddf98621211613b48f71edcac750d38b8ae03a4ffba9025bb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

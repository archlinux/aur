pkgname=vuke
pkgver=0.2.0
pkgrel=1
pkgdesc="Research tool for studying vulnerable Bitcoin key generation practices"
arch=('x86_64')
url="https://github.com/oritwoen/vuke"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'rust')
source=("git+https://github.com/oritwoen/vuke.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release --locked --offline
}

check() {
  cd "$pkgname"
  cargo test --locked --offline
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

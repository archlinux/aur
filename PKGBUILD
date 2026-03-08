# Maintainer: Nikita Kolmogorov <ubuntu@borodutch.com>
pkgname=myground
pkgver=0.1.42
pkgrel=1
pkgdesc='Self-hosting platform — hold your ground'
arch=('x86_64')
url='https://github.com/backmeupplz/myground'
license=('MIT')
depends=('docker')
makedepends=('cargo' 'bun-bin')
install=myground.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/backmeupplz/myground/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ffc63b29217826d9a79edb928846f18a9f215fc3193ce18cb88f2d8a78b1e0c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cd web && bun install && bun run build && cd ..
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}

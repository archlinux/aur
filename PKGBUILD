# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lifecycler
pkgver=0.2.9
pkgrel=1
pkgdesc="Terminal aquarium"
arch=('x86_64')
url="https://github.com/cxreiff/lifecycler"
license=('MIT' 'Apache-2.0' 'CC0-1.0')
depends=('gcc-libs' 'alsa-lib' 'systemd-libs')
optdepends=('wayland: Wayland support')
makedepends=('cargo' 'wayland')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a888798e3b061a6763b8d5c9c2cd0401bc902b1d279b65b18c2fea3ceb785af1d32a42092d2ba902286afed07905cdd07544de6056f8474b0dc30518ec6e42be')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" # --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

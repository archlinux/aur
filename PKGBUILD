# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver=1.0.3
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, and an interactive treemap GUI."
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
makedepends=('cargo-nightly' 'rust-nightly')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "edirstat.desktop"
)
sha512sums=(
  'caaa350ce0290f076c3ca5bef3a8eeba9b721da227957343466a6708f01a5230f17860202ce32d59d79454548741c9b38c2ecdd6238ab45093dce57bbfc350a1'
  '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3'
)

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # Install the documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install the 256x256 icon
  install -Dm 644 "icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # Install the .desktop file
  install -Dm 644 "$srcdir/edirstat.desktop" -t "$pkgdir/usr/share/applications"
}

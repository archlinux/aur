# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver=1.0.7
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, and an interactive treemap GUI."
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
makedepends=('cargo-nightly' 'rust-nightly')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha512sums=('63d452f012e462f0479359c8c37296bf9e3601d5b3da735982bf21730e988cb86152c9b072ec9a29d5d2e4a664c23623d7f8c7bcd414f99e98e8d60329e6a31c'
            '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3')

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
  install -Dm 644 "assets/img/icon-256x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # Install the .desktop file
  install -Dm 644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

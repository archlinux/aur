# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver=1.0.4
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
sha512sums=('8adb447cd071d3323d4640bbe584f464e9000272255abda90abccf17d911fe01579bd191ff32f2f18abbce57dde831000515d28be7fa4391a31fb6b70ec4a3fd'
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

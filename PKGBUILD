# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver=1.0.3
pkgrel=3
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, and an interactive treemap GUI."
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
makedepends=('cargo-nightly' 'rust-nightly')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname-$pkgver-icon.png::https://media.githubusercontent.com/media/Xangelix/edirstat/v$pkgver/icon.png"
)
sha512sums=('caaa350ce0290f076c3ca5bef3a8eeba9b721da227957343466a6708f01a5230f17860202ce32d59d79454548741c9b38c2ecdd6238ab45093dce57bbfc350a1'
            '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3'
            '215b2d317a9c92def7a0e1768c04ec0cf6283581563a873e8975746b7033721df2dcb632c59fd2a0b0b6626d56ec412531705af2ebd540a6f50cddf21c89962f')

prepare() {
  cp "$srcdir/$pkgname-$pkgver-icon.png" "$srcdir/$pkgname-$pkgver/icon.png"

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
  install -Dm 644 "$srcdir/$pkgname-$pkgver-icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # Install the .desktop file
  install -Dm 644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

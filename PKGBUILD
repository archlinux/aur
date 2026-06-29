# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver="2.0.1"
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, deduplication, and an interactive treemap GUI."
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
depends=('hicolor-icon-theme')
makedepends=('cargo-nightly' 'rust-nightly')
provides=('edirstat')
conflicts=('edirstat')
options=('!lto') # Disable LTO to prevent build-script linker errors
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha512sums=('75c723ad7c0fba7f5c15f7ab89db1a03ce99a0d141637cc1e2c6ba6c481c39f0237423a843ba56a5103ada319c6b3ff83f9ccfa92edb3a83db45474a2e087f0b'
            '5cbf9075b721335159eb3317cd3f787ac406fa7c398a2dea114870d362688f67809bbaaede155d8e1ad3a2830c35132ae37a02e24d9dabd60326b2b7e66a02b3')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  # Compile with release optimizations, frozen lockfile, and no default features
  cargo build --release --frozen --no-default-features
}

check() {
  cd "$pkgname-$pkgver"
  # Run tests with release optimizations, locked dependencies, and no default features
  cargo test --release --locked --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # Install the documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install the raster PNG icons for standard desktop sizes
  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm 644 "assets/img/icon_${size}x.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  # Install the scalable SVG vector icon as a high-DPI fallback
  install -Dm 644 "assets/img/icon-transparent.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  # Install the .desktop file
  install -Dm 644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}

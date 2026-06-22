# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=edirstat
pkgver="2.0.0"
pkgrel=1
pkgdesc="A fast, cross-platform disk usage analyzer with work-stealing multithreading, zero-copy snapshots, deduplication, and an interactive treemap GUI."
arch=('x86_64')
url="https://github.com/Xangelix/edirstat"
license=('MIT')
depends=('hicolor-icon-theme')
makedepends=('cargo-nightly' 'rust-nightly')
options=('!lto') # Disable LTO to prevent build-script linker errors
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha512sums=('6928a66d35df9a17d98c2873d1369393fc2b186eb3d11ab67bf24dd1f934dcce7142f7ca01e169e1bd8155feab3ebd3aa31305121752c8f511b1fae1aef3635d'
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

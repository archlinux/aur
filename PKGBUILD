install=mac-touchbar-plus.install
pkgname=mac-touchbar-plus
pkgver=0.1.2
pkgrel=1
pkgdesc="mac-touchbar-plus: A small Rust app with helpers"
arch=('x86_64')
url="https://github.com/dev-muhammad-adel/mac-touchbar-plus"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
#sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release 
}


package() {
  cd "$srcdir/$pkgname-$pkgver/target/release"

  # Copy all executables
  for bin in $(find . -maxdepth 1 -type f -executable ! -name '*.d'); do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$(basename "$bin")"
  done

  # Copy share files
  install -d "$pkgdir/usr/share/tiny-dfr"
  cp -r "$srcdir/$pkgname-$pkgver/share/tiny-dfr/"* "$pkgdir/usr/share/tiny-dfr/"

  # Copy etc files (systemd and udev)
  install -d "$pkgdir/etc"
  cp -r "$srcdir/$pkgname-$pkgver/etc/"* "$pkgdir/etc/"

  # Documentation and license
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

}

sha256sums=('fc5634af446132225b2388c74f8c72d7225fabbcd9ad97d64507ba241e9d716d')

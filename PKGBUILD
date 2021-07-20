pkgname=angle-grinder
pkgver=0.16
pkgrel=1
pkgdesc="Slice and dice logs on the command line"
arch=('x86_64')
url="https://github.com/rcoh/angle-grinder"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rcoh/$pkgname/archive/v$pkgver.tar.gz"
        "fix-split-when-used-on-wide-unicode-characters.patch::https://github.com/rcoh/angle-grinder/commit/215a0f9888e5f381323b0cff35f40029d4a81e5a.patch")
sha512sums=('2db0e5fcadea7098653ae67afd10f0b020c28fbd4a666a0a3f7492e8913e0c6622000c698616abf68955201b44a614e0f374a101f05fc1d0a3ec42f2e9eeaad8'
            '256a90c540b82a309c7135e11b69362c7d0bedb0a0c314e742ecb6fd9400feee8cd762e591e405fdd143916fbf8d6be285b54c8f4989f94d605a89f3ec0bd9a2')

prepare() {
  patch -ruN -p1 -d "$pkgname-$pkgver" < ../fix-split-when-used-on-wide-unicode-characters.patch
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --message-format=json-render-diagnostics |
  jq -r 'select(.out_dir) | select(.package_id | startswith("ag")) | .out_dir' > out_dir
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/agrind" "$pkgdir/usr/bin/agrind"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
pkgver=0.15.0
pkgrel=2
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'fontconfig')
makedepends=('cargo' 'git' 'libx11' 'python')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.zip")
sha256sums=('30aec04a33de5a19d7f8c83fcae03cd55f865bca4aa08d735c3f4a711b46d1bb'
            '7487a1c48bef3996ebcf32bf9afffde7d4b7ad814555360f673ba9eff6625ac0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 assets/com.github.mtkennerly.ludusavi.metainfo.xml -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "assets/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-v$pkgver-legal.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/legal.txt"
}

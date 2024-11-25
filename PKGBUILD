# Maintainer: gao <gao66 at sdf dot org>

pkgname=iptv-checker-rs
pkgver=3.2.1
pkgrel=1
pkgdesc="Checking links in IPTV playlists written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/zhimin-dev/iptv-checker-rs"
license=('unknown')
depends=('ffmpeg' 'openssl')
makedepends=('cargo')
install="$pkgname.install"
source=("https://github.com/zhimin-dev/iptv-checker-rs/archive/refs/tags/v$pkgver.tar.gz"
        "0001-update-openssl-dependency.patch"
        "iptv-checker-rs.service")
sha256sums=('f28480bc5793004d860b8ec77ff095013187e9d2bb00775ae7d1b6315d965c06'
            '034a5daec5e21305fd2a3dc2300e74c77049985887f8552aef02c90fd9794c8c'
            '3d65f14bc276cc78164d01de311cc9f5a6b08b0341a6e9f836bdda84171d3494')
backup=("usr/share/${pkgname}/tasks.json"
        "usr/lib/systemd/system/iptv-checker-rs.service")
provides=('iptv-checker-rs')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch --forward --strip=1 --input="$srcdir/0001-update-openssl-dependency.patch"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --offline --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/share/$pkgname/$pkgname"

  install -d "$pkgdir/usr/share/$pkgname/web"
  cp -r web/* "$pkgdir/usr/share/$pkgname/web"
  
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/iptv-checker-rs.service" "$pkgdir/usr/lib/systemd/system/iptv-checker-rs.service"
}

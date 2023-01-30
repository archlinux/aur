# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww
pkgver=0.7.0
pkgrel=2
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/Horus645/swww/commit/d2f3570aa41707924abd4c0084850351580a21db.patch")

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/d2f3570aa41707924abd4c0084850351580a21db.patch"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm755 "target/release/swww-daemon" "$pkgdir/usr/bin/swww-daemon"
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"
  install -Dm644 "completions/_swww" "$pkgdir/usr/share/zsh/site-functions/_swww"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('bb5007c1a1245bccbad7187d0d15ca3d4ecd016ff99da001c78b899d89c21a5a'
            'bb500ec5c2af1ff86b2656aaa74092400315fa3b1c562bbb2944a1bcc522dee5')

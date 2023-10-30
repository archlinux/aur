# Maintainer: Riolku <me [at] kgugeler [dot] ca>
pkgname=kambi
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple rotating wallpaper client for Wayland'
arch=('x86_64')
url="https://git.sr.ht/~riolku/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'scdoc')
provides=("$pkgname")
conflicts=('kambi-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('af7c4ed4dd4e1ffac5f5d44a01e8505ba4cfc67026bbb785b4791c6aedc83ddc')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
  scdoc < man/kambi.5.scd > man/kambi.5
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/kambi"
  install -Dm0755 -t "$pkgdir/usr/share/man/man5" "man/kambi.5"
}

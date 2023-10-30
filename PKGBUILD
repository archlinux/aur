# Maintainer: Riolku <me [at] kgugeler [dot] ca>
pkgname=kambi-git
pkgver=de9b2b
pkgrel=1
pkgdesc='Simple rotating wallpaper client for Wayland'
arch=('x86_64')
url="https://git.sr.ht/~riolku/kambi"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'scdoc')
provides=("$pkgname")
conflicts=('kambi')
source=("$pkgname::git+https://git.sr.ht/~riolku/kambi")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --always | sed -e 's|-|.|g' -e '1s|^.||'
}

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
  scdoc < man/kambi.5.scd > man/kambi.5
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/kambi"
  install -Dm0755 -t "$pkgdir/usr/share/man/man5" "man/kambi.5"
}

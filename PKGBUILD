# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=falcond-gui
pkgver=1.0.1
pkgrel=2
pkgdesc="A GTK4/LibAdwaita application to control and monitor the Falcond gaming optimization daemon."
arch=('x86_64')
url="https://git.pika-os.com/general-packages/falcond-gui"
license=('MIT')
depends=(
  'falcond'
  'gtk4'
  'libadwaita'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('2e153e2fd63cae328b777b609791e68d2d9c3ff586a604a9130ca2ff89ea60e3')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen

  desktop-file-validate "res/$pkgname.desktop"
}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 res/falcond.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "res/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 ../LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

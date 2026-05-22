# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=falcond-gui
_app_id=com.pikaos.falcondgui
pkgver=1.0.3
pkgrel=1
pkgdesc="A GTK4/LibAdwaita application to control and monitor the Falcond gaming optimization daemon."
arch=('x86_64')
url="https://git.pika-os.com/custom-gui-packages/falcond-gui"
license=('MIT')
depends=(
  'falcond'
  'gtk4'
  'libadwaita'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('2505d365bbccf3a4d170c4ba333aa4378b699520232411ceb2193cd10474b913')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
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

  desktop-file-validate "res/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "res/${_app_id}.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "res/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 ../README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ../LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

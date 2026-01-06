# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=falcond-gui
pkgver=1.0.0
pkgrel=1
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
sha256sums=('067aa7d0f789e8a6f5325f8b7b6439c54b28527b3632c13bbd32f8304897df81')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=com.pikaos.falcondgui \
    "res/$pkgname.desktop"
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
  install -Dm644 res/falcond.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
  install -Dm644 "res/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 ../LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

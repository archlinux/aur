# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=local-rocket-stats
pkgver=0.1.0
pkgrel=1
pkgdesc="Rocket League stats and MMR tracker that reads the game's local data (Stats API + log), with tray and web dashboard"
arch=('x86_64')
url="https://github.com/deddroid/local-rocket-stats"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('xdg-utils: open the dashboard in the browser')
provides=("$pkgname")
conflicts=("$pkgname-bin")
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3fc6825a174459d0e0f9ec3fb883eab549b8be41da232a7b78d58218f3b97a6f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$pkgname.png"
  done
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE THIRD-PARTY-NOTICES -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

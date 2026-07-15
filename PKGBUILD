# Maintainer: SpeeNotPee <heckingmaster666@gmail.com>
pkgname=pigment-launcher
pkgver=0.1.2
pkgrel=1
pkgdesc="Roblox launcher and manager for Linux (drives the Sober runtime)"
arch=('x86_64' 'aarch64')
url="https://github.com/SpeeNotPee/Pigment"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('rust' 'cargo')
optdepends=('flatpak: required to install and run the Sober runtime'
            'xdg-utils: to set Pigment as the default roblox:// handler'
            'kdesu: KDE service-cache refresh when changing the handler')
# GitHub generates this tarball for the tag; it extracts to Pigment-$pkgver/.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SpeeNotPee/Pigment/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69dffbe3bc300b59f74f67bad0f6bb4645a913669a6f468a9fba11e4b67f39d5')

prepare() {
  cd "$srcdir/Pigment-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Fetch dependencies now so build() can run fully offline (--frozen).
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/Pigment-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

package() {
  cd "$srcdir/Pigment-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: ChoiWheatley <chltmdgus604 at naver dot com>
pkgname=kunsplash-wallpapers
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial Plasma 6 widget and daemon that sets your wallpaper from Unsplash"
arch=('x86_64' 'aarch64')
url="https://github.com/ChoiWheatley/kunsplash-wallpapers"
license=('MIT')
depends=('glibc' 'libgcc' 'kirigami' 'libplasma' 'plasma-workspace' 'qt6-declarative' 'kconfig' 'libkscreen' 'xdg-user-dirs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e9f73f911951baae2fd9f3a40a67f6bce5fe99a672d202e983f6cd8b7721f4c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path daemon/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=daemon/target
  make build CARGO="cargo --frozen"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=daemon/target
  make test CARGO="cargo --frozen"
}

package() {
  cd "$pkgname-$pkgver"
  make install-daemon install-plasmoid DESTDIR="$pkgdir" PREFIX=/usr \
    UNITDIR=/usr/lib/systemd/user CARGO=true
}

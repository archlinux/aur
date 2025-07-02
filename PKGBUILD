# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=distroshelf
pkgver=1.0.12
pkgrel=1
pkgdesc="A GUI for Distrobox Containers"
arch=('x86_64' 'aarch64')
url="https://github.com/ranfdev/DistroShelf"
license=('GPL-3.0-or-later')
depends=(
  'distrobox'
  'libadwaita'
)
makedepends=(
  'cargo'
  'meson'
)
source=("DistroShelf-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76616d0cb6b9d9dc814d3663be54dd0c5c158743d35a6950b61b19ac53ecc1bc')

prepare() {
  cd "DistroShelf-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "DistroShelf-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

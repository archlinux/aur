# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=distroshelf
pkgver=1.2.0
pkgrel=1
pkgdesc="A GUI for Distrobox Containers"
arch=('x86_64' 'aarch64')
url="https://github.com/ranfdev/DistroShelf"
license=('GPL-3.0-or-later')
depends=(
  'distrobox'
  'gtk4'
  'libadwaita'
  'vte4'
  'which'
)
makedepends=(
  'cargo'
  'meson'
)
source=("DistroShelf-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94560cebcded2e8ea92c30d8817c5e07d563aea7f5065e75e963da9fc05c8aaf')

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

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=distroshelf
pkgver=1.4.3
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
sha256sums=('cfda689e298e72b927dc6bfdc31189376033f95117ea496f1b8abb4c640a8689')

prepare() {
  cd "DistroShelf-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
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

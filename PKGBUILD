# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=distroshelf
pkgver=1.0.5
pkgrel=1
pkgdesc="A GUI for Distrobox Containers"
arch=('x86_64' 'aarc64')
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
sha256sums=('e6cffc76ee6b0260c9107ce209de9943153d99bdd98e86779bf7c9412613a152')

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

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mission-center
pkgver=0.6.2
pkgrel=2
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=('x86_64' 'aarch64')
url="https://missioncenter.io"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'systemd'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'meson'
)
checkdepends=(
  'appstream-glib'
)
source=("https://gitlab.com/mission-center-devs/mission-center/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a327a3ec7525f56b7ddbb9f69a502ace84f0cc53af19d99e22e92e3e88cb55ee')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build --buildtype=release
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

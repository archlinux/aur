# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mission-center
pkgver=0.6.1
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
sha256sums=('0c76860edebc612dbda1c0b872be8455ca23a24ef3a2d66698cc591a57ecd800')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

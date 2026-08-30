pkgname=powercurve-git
pkgver=0.4.0.r665.8a8ea13
pkgrel=1
pkgdesc="Lightweight desktop power management daemon with configurable fan curves"
arch=('x86_64' 'aarch64')
url="https://github.com/crenshawdev/powercurve"
license=('GPL-3.0-only')
depends=(
  'dbus'
)
makedepends=('cargo' 'git')
provides=('system76-power' 'power-profiles-daemon')
conflicts=('system76-power' 'power-profiles-daemon')
backup=('etc/powercurve/fan.toml')
install="powercurve.install"
source=("git+https://github.com/crenshawdev/powercurve.git")
sha256sums=('SKIP')

pkgver() {
  cd "powercurve"
  local _ver
  _ver=$(grep '^version' Cargo.toml | head -1 | sed 's/.*"\(.*\)"/\1/' | tr '-' '.')
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "powercurve"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "powercurve"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make
}

package() {
  cd "powercurve"
  export CARGO_TARGET_DIR=target
  make DESTDIR="${pkgdir}" install
}

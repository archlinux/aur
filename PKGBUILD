# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=packet
pkgver=0.7.3
pkgrel=1
pkgdesc="A Quick Share client for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/nozwock/packet"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'git'
  'meson'
  'protobuf'
)
optdepends=(
  'nautilus-python: Nautilus integration'
  'python-dbus: Needed for Nautilus extension'
)
source=("git+https://github.com/nozwock/packet.git#tag=$pkgver")
sha256sums=('9629cab2daf01b360b9f88210e6f0c910f096c1310635ed6641ad86e7b300c13')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

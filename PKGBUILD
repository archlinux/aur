# Maintainer: nachopro <tech at local dot net dot ar>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=trigonum
pkgver=0.2.0
pkgrel=1
pkgdesc='Lightweight viewer for STL 3D models'
arch=(x86_64 aarch64)
url='https://github.com/devedetti/trigonum'
license=(GPL-3.0-or-later)
depends=(
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libepoxy # se carga con dlopen para obtener las funciones de OpenGL
  libgcc
  pango
)
makedepends=(
  cargo
  meson
)
options=(!debug)
checkdepends=(
  appstream
  desktop-file-utils
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Plantilla: el workflow de release completa las sumas con updpkgsums y genera el .SRCINFO.
sha256sums=('0c0a388745c9f61bb8bfe8f6d71b1204a739ff255a0f031b82ff0cb5b4e6ebd3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  meson test -C build --print-errorlogs
}

package() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_NET_OFFLINE=true
  meson install -C build --destdir "$pkgdir"
}

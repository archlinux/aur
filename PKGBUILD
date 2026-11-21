# Maintainer: nachopro <tech at local dot net dot ar>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=trigonum
pkgver=0.1.2
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
checkdepends=(
  appstream
  desktop-file-utils
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Plantilla: el workflow de release completa las sumas con updpkgsums y genera el .SRCINFO.
sha256sums=('2f3f716dec63f3fb5009caa70e819c898d790728dab6b04e48e3eefd5373f458')

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

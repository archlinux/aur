# Maintainer: nachopro <tech at local dot net dot ar>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=trigonum
pkgver=0.1.1
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
# Reemplazar con `updpkgsums` una vez publicado el tag v$pkgver.
sha256sums=('453d35a4d4696701a769f920c955e589e8b6febde24d2666929541c1ef8af7e5')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geopard
pkgver=1.5.0
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
_commit=52aa20fd0b9bd43e76b97906ba5b10bac57ec5a1  # tags/v1.5.0^0
source=("git+https://github.com/ranfdev/Geopard.git#commit=$_commit")
sha256sums=('3fc98dc103618a6a2c6a3eab043662b003d9e7d00f7054a5f0854a637babe42c')

pkgver() {
  cd Geopard
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Geopard
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Geopard build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

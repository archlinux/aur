# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geopard
pkgver=1.4.0
pkgrel=2
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
license=('GPL-3.0-or-later')
depends=('libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=9f9abcdd5d117ff808eb5d4cc22e06fd210c9d2c  # tags/v1.4.0^0
source=("git+https://github.com/ranfdev/Geopard.git#commit=$_commit"
        'https://github.com/ranfdev/Geopard/pull/74.patch')
sha256sums=('SKIP'
            'ff8ae33144906e844d5b80bdb9865d4bdc4387dc44d9e0ab0ef34a26d1a1fbf5')

pkgver() {
  cd Geopard
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd Geopard

  # Link handling
  # https://github.com/ranfdev/Geopard/issues/71
  patch -Np1 -i ../74.patch

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
